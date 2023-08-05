class AddMerchantReferenceToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :merchant_reference, null: false
  end
end
