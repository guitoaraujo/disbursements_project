class Merchant < ApplicationRecord
  has_many :orders
  has_many :disbursements

  before_save :set_weekday

  validates :reference, :email, :live_on, :disbursement_frequency, :minimum_monthly_fee, :weekday, presence: true
  validates :reference, :email, uniqueness: true
  validate :email_format

  enum disbursement_frequency: %i[daily weekly]

  private

  def set_weekday
    weekday = live_on.wday
  end

  def email_format
    errors.add(:email, 'invalid format') unless email&.match?(/^(.+)@(.+)$/)
  end
end
