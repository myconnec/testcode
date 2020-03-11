class ListingsController < ApplicationController
  around_filter :catch_not_found
  impressionist actions: [:show], unique: [:session_hash]

  before_action :set_s3_direct_post, only: [:upload]
  before_action :authenticate_user!, only: [:new, :create, :edit, :payment, :upload, :upload_update, :upvote]
  before_action :is_user?, only: [:create_payment, :destroy, :payment, :sold, :update, :upload_update, :upload]

  def index
    redirect_to '/'
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.ademail = current_user.email
    @listing.ending_at = Time.now.to_i + 2592000
    @listing.user = current_user
    promo_1 = false

    # get subcategory MDL data
    listing_sub_category = Subcategory.find(@listing.subcategory_id)

    if listing_sub_category.chargable > 0
      @listing.charge_amount = listing_sub_category.chargable

      # if the user promo counter is > 0
      if current_user.promo_1 > 0
        promo_1 = true # using a promo_1 listing
        @listing.ending_at = Time.now.to_i + 3888000 # 45 days duration
        @listing.charge_amount = 0 # no charge for a promo listing
      end
    end

    if @listing.save
      if listing_sub_category.chargable > 0 && current_user.promo_1 <= 0
        return redirect_to action: "payment", id: @listing.id
      end

      return redirect_to action: "upload", id: @listing.id
    else
      return render 'new', :flash => { :danger => @listing.errors.full_messages.to_sentence }
    end
  end

  def payment
    @listing = Listing.find(params[:id])
  end

  def sold
    @listing = Listing.find(params[:id])
    @listing.sold = Time.now.to_i

    if !@listing.save
      flash[:danger] = 'An error occured while updating your Listing as sold.'
      redirect_to(:back)
    end

    flash[:success] = 'Listing marked as SOLD. It will not longer be visible to other users.'
    redirect_to(:back)
  end

  def create_payment
    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here: https://dashboard.stripe.com/account/apikeys
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']

    # Token is created using Checkout or Elements!
    # Get the payment token ID submitted by the form:
    token = params[:stripeToken]

    #  find the listing based on the id provided
    @listing = Listing.find(params[:id])

    # create the charge to Stripe
    charge = Stripe::Charge.create({
        amount: @listing.charge_amount.to_i,
        currency: 'usd',
        description: 'ConnecHub listing.',
        source: token,
    })

    if charge.save
      @listing.charge_complete = 1
      if @listing.save
        return redirect_to action: "upload", id: @listing.id
      end
      flash[:danger] = 'Your payment was successful; however, an error occured while posting your listing. Please cotacgt support@connechub.com for assistance.'
    else
      flash[:danger] = charge.errors.full_messages.to_sentence
    end

    redirect_to action: "payment", id: @listing.id
  end

  def upload
    @listing = Listing.find(params[:id])
  end

  def update_upload
    @listing = Listing.find(params[:id])

    # if someone find the upload form but the Listing requires payment, redirect to payment form
    if @listing.charge_amount > 0 && @listing.charge_complete != 1
      return redirect_to action: "payment", id: @listing.id
    end

    # File.basename does not work as it considers the '.' character to be the name delimiter
    # However, modern devices name trimmed files `trim.${UUID}.mp4`. As such basename only returns `trim`.
    # So, we have to do a reverse count to the last `.` and truncate the string at that lingth.
    # replace ANY file extension with .mp4, that is the ONLY output format we provide
    file_name = params[:media_file_name]
    # file_name = file_name[0...(file_name.length - file_name.reverse.index('.'))] + 'mp4'
    file_name = file_name.downcase.gsub(/[^0-9a-zA-Z\-\.\/]/, '')

    # check file extention is of allowed format
    file_ext = file_name[(file_name.length - file_name.reverse.index('.'))...file_name.length].downcase
    if !['avi', 'mov', 'mp4', 'mkv'].include? file_ext
      flash[:danger] = 'Please provide a video file for your listing. File types .avi, .mov, .mp4, .mkv are accepted.'
      return redirect_to action: "upload", id: @listing.id
    end

    @listing.media_file_name = file_name
    @listing.media_updated_at = Time.now.to_i
    @listing.save

    if !@listing.save
      flash[:danger] = 'An error occured while updating your Listing with the video.'
      return redirect_to action: "upload", id: @listing.id
    end

    flash[:success] = "Video has been uploaded. You will recieve an email once processing completed."
    return render :nothing => true, :status => 200
  end

  def show
    @listing = Listing
      .where("id = '#{params[:id]}'")
      .where("ending_at > '#{Time.now.to_i}'")
      .first

    # if not listing found (ie deleted) redirect back to landing view w/ message
    if @listing.blank?
      return redirect_to root_url, :flash => { :danger => "Sorry, that Listing was not found." }
    end

    @comments = Comment.where(listing_id: @listing).order("created_at DESC")
    @user = current_user

    # source https://stackoverflow.com/questions/44741473/recommended-way-to-generate-a-presigned-url-to-s3-bucket-in-ruby
    # source https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/S3/Object.html#presigned_url-instance_method
    signer = Aws::S3::Presigner.new
    @presigned_media_url = signer.presigned_url(
      :get_object,
      bucket: ENV['AWS_S3_MEDIA_DISPLAY_BUCKET'],
      key: (@listing.media_file_name)
    )
  end

  def edit
    @listing = Listing.find(params[:id])
    @category = @listing.category
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    redirect_to @listing, :flash => { :success => "Listing has been updated." }
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to @listing, :flash => { :success => "Listing has been deleted." }
  end

  def upvote
    @listing = Listing.find(params[:id])
    @listing.upvote_by current_user
    redirect_to :back
  end

  def search
    @all_categories = Category.where('1=1')

    @listings = Listing.search(params)

    signer = Aws::S3::Presigner.new
    @listings.each do | listing |
      if !listing.has_attribute?(:media_file_name)
        next
      end

      listing.presigned_media_url = signer.presigned_url(
        :get_object,
        bucket: ENV['AWS_S3_MEDIA_DISPLAY_BUCKET'],
        key: (listing.media_file_name + '-00001.png')
      )
    end
  end

  private

  def listing_params
    params.require(:listing).permit(
      :ademail,
      :category_id,
      :city,
      :condition_id,
      :description,
      :id,
      :media_file_name,
      :price,
      :state,
      :subcategory_id,
      :title,
      :zipcode,
    )
  end

  def is_user?
    @listing = Listing.find(params[:id])
    if current_user != @listing.user
      return redirect_to root_url, :flash => { :danger => "Sorry, you are not the user of this listing." }
    end
  end

  def set_s3_direct_post
    @s3_direct_post = AWS_S3_MEDIA_SOURCE_BUCKET.presigned_post(
      key: "#{SecureRandom.uuid}/${filename}",
      success_action_status: '201'
    )
  end

  def catch_not_found
    yield
    # TODO maybe more specific errors here?
    rescue
      if ENV['STAGE'].downcase != 'dev'
        redirect_to root_url, :flash => { :danger => "Sorry, that was not found. Maybe it has already gone away?" }
      end
  end
end
