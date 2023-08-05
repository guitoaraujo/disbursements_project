class OrdersController < ApplicationController
  before_action :set_merchant

  def create
    order = Order.new(orders_params)
    if order.save
      render json: { order: order }, status: :ok
    else
      render json: { order: order.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_merchant
    @merchant = Merchant.find(params[:merchant_id])
  end

  def orders_params
    params.permit(:amount).merge(merchant_id: @merchant.id)
  end
end
