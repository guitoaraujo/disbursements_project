class AddMerchantToDisbursements < ActiveRecord::Migration[7.0]
  def change
    add_reference :disbursements, :merchant, null: false, foreign_key: true
  end
end
