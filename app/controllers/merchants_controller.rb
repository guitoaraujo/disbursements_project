class MerchantsController < ApplicationController
  def create
    merchant = Merchant.new(merchants_params)
    if merchant.save
      render json: { merchant: merchant }, status: :ok
    else
      render json: { merchant: merchant.errors }, status: :unprocessable_entity
    end
  end

  private

  def merchants_params
    params.permit(:reference, :email, :live_on, :disbursement_frequency, :minimum_monthly_fee)
  end
end
