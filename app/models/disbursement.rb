class Disbursement < ApplicationRecord
  belongs_to :merchant

  validates :orders, :disbursed_at, :fee, presence: true

  after_validation :set_reference

  private

  def set_reference
    self.reference = SecureRandom.hex(10)
  end
end
