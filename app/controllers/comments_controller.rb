class CommentsController < ApplicationController
  before_action :find_listing
  before_action :find_comment, only: [:destroy]

  
    def create
        @comment = @listing.comments.create(params[:comment].permit(:body)) 
        @comment.user_id = current_user.id
        @comment.save
        
        if @comment.save
            redirect_to(:back)
        else
            render 'new'
        end
    end
    
    def destroy
        @comment.destroy
        redirect_to(:back)
    end
    
private

    def find_listing
        @listing = Listing.find(params[:listing_id])
    end
    
    def find_comment
        @comment = @listing.comments.find(params[:id])
    end

end