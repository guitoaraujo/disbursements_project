class CreateDisbursementJob < ApplicationJob
  queue_as :default

  def perform
    weekday = Date.today.wday
    merchants = Merchant.all

    merchants.each do |merchant|
      next if merchant.weekly? && merchant.weekday != weekday

      fee = last_month_minimum_monthly_fee(merchant)

      orders = merchant.orders.waiting
      orders.each do |order|
        fee += order.amount * 0.01 if order.amount < 50.00
        fee += order.amount * 0.095 if order.amount > 50.00 && order.amount < 300.00

        fee += order.amount * 0.085
      end

      Disbursement.create(orders: orders.pluck(:reference), fee: fee)
    end
  end

  private

  def last_month_minimum_monthly_fee(merchant)
    return 0.00 unless Date.today == Date.today.beginning_of_month

    start_date = Date.today.last_month.beginning_of_month
    end_date = Date.today.last_month.end_of_month
    fee = merchant.disbursements.where(disbursed_at: [start_date..end_date]).pluck(:fee).sum
    value = fee - merchant.minimum_monthly_fee
    return 0.00 if value.positive?

    value.abs
  end
end
