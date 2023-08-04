class Merchant < ApplicationRecord
  validates :reference, :email, :live_on, :disbursement_frequency, :minimum_monthly_fee, presence: true
  validates :reference, :email, uniqueness: true
  validate :email_format

  enum disbursement_frequency: %w[DAILY WEEKLY]

  private

  def email_format
    errors.add(:email, 'invalid format') unless email&.match?(/^(.+)@(.+)$/)
  end
end
