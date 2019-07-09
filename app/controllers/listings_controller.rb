class ListingsController < ApplicationController
  around_filter :catch_not_found
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

    # if the cat req. payment
    if @listing.category =""
    if !process_payment
      flash[:alert] = 'And error occurent while process the payment, please double check and try again.'
      render 'new'
    end

    if @listing.save
      redirect_to @listing
    else
      flash[:alert] = @listing.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def show
    @listing = Listing
      .where("id = '#{params[:id]}'")
      .where("ending_at > '#{Time.now.to_i}'")
      .first
    @comments = Comment.where(listing_id: @listing).order("created_at DESC")
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
    @listings = Listing.search(params).where(:ending_at > Time.now.to_i)
    @listings = Listing

  end

  private

  def listing_params
    params.require(:listing).permit(:title, :price, :media, :description, :city, :state, :zipcode, :ademail, :category_id, :subcategory_id)
  end

  def is_user?
    @listing = Listing.find(params[:id])
    unless current_user = @listing.user
      redirect_to root_path, alert: "Sorry, you are not the user of this listing."
    end
  end

  def catch_not_found
    yield
    # TODO maybe more specific errors here?
    rescue
      if ENV['APP_ENV'].downcase != 'lcl' or ENV['APP_ENV'].downcase == 'dev'
        redirect_to root_url, :flash => { :error => "Sorry, that was not found. Maybe it has already gone away?" }
      end
  end

  def process_payment
    begin
      Stripe.api_key = ENV['STRIPE_SK']
      session = Stripe::Checkout::Session.create(
        billing_address_collection: 'required',
        payment_method_types: ['card'],
        line_items: [{
          name: 'Standard Posting',
          description: @listing.description,
          amount: @listing.amount,
          currency: 'usd',
          quantity: 1,
        }],
        success_url: ENV['APP_HOST'],
        cancel_url: ENV['APP_HOST'],
      )
    rescue Stripe::CardError => e
      # Since it's a decline, Stripe::CardError will be caught
      body = e.json_body
      err  = body[:error]
    
      puts "Status is: #{e.http_status}"
      puts "Type is: #{err[:type]}"
      puts "Charge ID is: #{err[:charge]}"
      # The following fields are optional
      puts "Code is: #{err[:code]}" if err[:code]
      puts "Decline code is: #{err[:decline_code]}" if err[:decline_code]
      puts "Param is: #{err[:param]}" if err[:param]
      puts "Message is: #{err[:message]}" if err[:message]
    rescue Stripe::RateLimitError => e
      # Too many requests made to the API too quickly
    rescue Stripe::InvalidRequestError => e
      # Invalid parameters were supplied to Stripe's API
    rescue Stripe::AuthenticationError => e
      # Authentication with Stripe's API failed
      # (maybe you changed API keys recently)
    rescue Stripe::APIConnectionError => e
      # Network communication with Stripe failed
    rescue Stripe::StripeError => e
      # Display a very generic error to the user, and maybe send
      # yourself an email
    rescue => e
      # Something else happened, completely unrelated to Stripe
    end
  end
end
