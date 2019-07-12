class UsersController < ApplicationController
    def show
      @user = User.find_by username: params[:username]
      @user.listings = Listing
        .where(user_id: @user.id)
        .where("ending_at > '#{Time.now.to_i}'")
        .order("created_at DESC")
    end
end
