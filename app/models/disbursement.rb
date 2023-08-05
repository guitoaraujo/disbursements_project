class Disbursement < ApplicationRecord
  before_save :generate_reference

  validates :reference, :orders, :disbursed_at, :fee, presence: true

  private

  def generate_reference
    reference = SecureRandom.hex(10)
  end
end
