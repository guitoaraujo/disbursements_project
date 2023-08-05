require 'csv'

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

  def self.import_data
    file_path = File.read('merchants.csv')
    csv = CSV.parse(file_path, col_sep: ';', row_sep: :auto, skip_blanks: true)
    csv.each_with_index do |row, index|
      next if index.zero?

      Merchant.create(
        reference: row[0],
        email: row[1],
        live_on: row[2],
        disbursement_frequency: row[3].downcase.to_s,
        minimum_monthly_fee: row[4].to_f
      )
    end
  end

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
