class AdminController < ApplicationController
    before_filter :authorize_admin, only: :show

  def show
    @total = User.count_total()
    @today = User.count_today()
    @month = User.count_month()
  end

  def authorize_admin
    # allow user only if set and is admin
    if !current_user.nil? and current_user.admin
      return
    end

    # else return to prev. page
    redirect_to :root, status: 401
  end
end
