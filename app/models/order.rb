class Order < ApplicationRecord
  belongs_to :merchant

  validates :amount, presence: true
end
