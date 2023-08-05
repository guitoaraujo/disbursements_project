class CreateDisbursements < ActiveRecord::Migration[7.0]
  def change
    create_table :disbursements do |t|
      t.string :reference, null: false
      t.text :orders, null: false
      t.date :disbursed_at, null: false
      t.decimal :fee, null: false

      t.timestamps
    end
  end
end
