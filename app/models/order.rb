class Order < ApplicationRecord
  belongs_to :merchant

  validates :amount, :status, presence: true

  enum status: %i[waiting disbursed]
end
