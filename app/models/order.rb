class Order < ApplicationRecord
  belongs_to :merchant

  validates :amount, :status, presence: true

  after_validation :set_merchant_reference

  enum status: %i[waiting disbursed]

  private

  def set_merchant_reference
    self.merchant_reference = merchant.reference
  end
end
