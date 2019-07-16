class ChargesController < ApplicationController
    rescue_from Stripe::CardError, with: :catch_exception

    def new
    end

    def create
      StripeChargesServices.new(check_params, current_user).call
      redirect_to new_charge_path
    end

    private

    def check_params
      params.permit(:current_user, :order_id, :stripe_amount, :stripe_email, :stripe_token, :utf8, :authenticity_token)
    end

    def catch_exception(exception)
      flash[:error] = exception.message
    end
end
