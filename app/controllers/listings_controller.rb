class ListingsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]
  before_filter :is_user?, only: [:edit, :update, :delete, :upvote, :downvote]
  impressionist actions: [:show], unique: [:session_hash]
  
  def new
    @listing = Listing.new
  end
  
  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to @listing
    else
      flash[:alert] = @listing.errors.full_messages.to_sentence
      render 'new'
    end
  end
  
  def show
    @listing = Listing.find(params[:id])
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
    redirect_to root_path
  end
  
  def upvote
		@listing.upvote_by current_user
		redirect_to :back
  end
  
  def search
    @listings = Listing.search(params)
  end
  
  def mylistings
    @listings = Listing.where(user: current_user).order("created_at DESC")
  end
  
  private
  
  def listing_params
    params.require(:listing).permit(:title, :price, :pin_image, :description, :city, :state, :zipcode, :ademail, :category_id, :subcategory_id)
  end
  
  def is_user?
    @listing = Listing.find(params[:id])
    unless current_user = @listing.user
      redirect_to root_path, alert: "Sorry, you are not the user of this listing."
    end
  end
  
end