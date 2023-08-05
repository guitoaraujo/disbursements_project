require 'csv'

class Order < ApplicationRecord
  belongs_to :merchant

  validates :amount, :status, presence: true

  after_validation :set_merchant_reference

  enum status: %i[waiting disbursed]

  def self.import_data
    file_path = File.read('orders.csv')
    csv = CSV.parse(file_path, col_sep: ';', row_sep: :auto, skip_blanks: true)
    csv.each_with_index do |row, index|
      next if index.zero?

      merchant = Merchant.find_by(reference: row[0])
      next if merchant.blank?

      Order.create(
        merchant_id: merchant.id,
        merchant_reference: row[0],
        amount: row[1].to_f,
        created_at: row[2]
      )
    end
  end

  private

  def set_merchant_reference
    self.merchant_reference = merchant.reference if merchant_reference.blank?
  end
end
