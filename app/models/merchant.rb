class Merchant < ApplicationRecord
  has_many :orders
  has_many :disbursements

  validates :reference, :email, :live_on, :disbursement_frequency, :minimum_monthly_fee, presence: true
  validates :reference, :email, uniqueness: true
  validate :email_format
  validate :live_on_format
  validate :live_on_format

  after_validation :set_weekday

  enum disbursement_frequency: %i[daily weekly]

  private

  def set_weekday
    self.weekday = live_on.to_date.wday
  end

  def email_format
    errors.add(:email, 'invalid format') unless email&.match?(/^(.+)@(.+)$/)
  end

  def live_on_format
    errors.add(:live_on, 'invalid format') unless live_on&.to_s&.match?(/\d{4}-\d{2}-\d{2}/)
  end
end
