class ListingsController < ApplicationController
  around_filter :catch_not_found
  before_action :set_s3_direct_post, only: [:upload, :create_upload]
  before_filter :authenticate_user!, only: [:new, :create]
  before_filter :is_user?, only: [:edit, :update, :delete, :upvote, :downvote]
  impressionist actions: [:show], unique: [:session_hash]

  def index
    redirect_to '/'
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.ademail = current_user.email
    # TODO: phase 1: limit to 30 days. Phase 2: based on selected upgrades
    @listing.ending_at = Time.now.to_i + 2592000
    @listing.user = current_user

    # read the subcategory, if chargable > 0  set amount on listing
    listing_sub_category = Subcategory.find(@listing.subcategory_id)
    if listing_sub_category.chargable > 0
      @listing.charge_amount = listing_sub_category.chargable
    end

    if @listing.save
      # if subcategory.chargable > 0, goto payment for
      if listing_sub_category.chargable > 0
        return redirect_to action: "payment", id: @listing.id
      else
        return redirect_to action: "upload", id: @listing.id
      end
    else
      flash[:danger] = @listing.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def payment
    @listing = Listing.find(params[:id])
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

    # replace ANY file extension with .mp4, that is the ONLY output format we provide
    file_name = params[:media_file_name]
    # File.basename does nto work as it considers the '.' character to be the name delimiter
    # However, modern devices name trimmed files `trim.${UUID}.mp4`. As such basename only returns `trim`.
    # So, we have to do a reverse count to the last `.` and truncate the string at that lingth.
    # file_name = File.dirname(file_name) + '/' + File.basename(file_name, '.*') + '.mp4'
    # file_name = File.dirname(file_name) + '/' + file_name + 'mp4'
    file_name = file_name.reverse
    last_dot_pos = file_name.index('.')
    file_name = file_name.reverse
    file_name = file_name[0...(file_name.length - last_dot_pos)]
    file_name = file_name + 'mp4'

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

    # source https://stackoverflow.com/questions/44741473/recommended-way-to-generate-a-presigned-url-to-s3-bucket-in-ruby
    # source https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/S3/Object.html#presigned_url-instance_method
    signer = Aws::S3::Presigner.new
    @presigned_media_url = signer.presigned_url(
      :get_object,
      bucket: ENV['AWS_S3_MEDIA_DISPLAY_BUCKET'],
      key: @listing.media_file_name
    )
  end

  def edit
    @listing = Listing.find(params[:id])
    @category = @listing.category
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    redirect_to @listing
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to @listing
  end

  def upvote
		@listing.upvote_by current_user
		redirect_to :back
  end

  def search
    @listings = Listing.search(params)
    signer = Aws::S3::Presigner.new
    @listings.each do | listing |
      if !listing.has_attribute?(:media_file_name)
        next
      end

      listing.presigned_media_url = signer.presigned_url(
        :get_object,
        bucket: ENV['AWS_S3_MEDIA_DISPLAY_BUCKET'],
        key: listing.media_file_name
      )
    end
  end

  private

  def listing_params
    params.require(:listing).permit(
      :ademail,
      :category_id,
      :city,
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
    unless current_user = @listing.user
      redirect_to root_path, alert: "Sorry, you are not the user of this listing."
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
      if ENV['APP_ENV'].downcase != 'dev'
        redirect_to root_url, :flash => { :danger => "Sorry, that was not found. Maybe it has already gone away?" }
      end
  end
end
