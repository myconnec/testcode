class ListingsController < ApplicationController
  # around_filter :catch_not_found
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
    @listings = Listing.search(params)
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

  # def catch_not_found
  #   yield
  #   # TODO maybe more specific errors here?
  #   rescue
  #     if ENV['APP_ENV'].downcase != 'lcl' or ENV['APP_ENV'].downcase == 'dev'
  #       redirect_to root_url, :flash => { :error => "Sorry, that was not found. Maybe it has already gone away?" }
  #     end
  # end
end
