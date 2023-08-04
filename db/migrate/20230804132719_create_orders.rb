class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :merchant, null: false, foreign_key: true
      t.decimal :amount, null: false

      t.timestamps
    end
  end
end
