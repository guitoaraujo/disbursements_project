class CreateMerchants < ActiveRecord::Migration[7.0]
  def change
    create_table :merchants do |t|
      t.string :reference, null: false
      t.string :email, null: false
      t.date :live_on, null: false
      t.integer :disbursement_frequency, null: false, default: 0
      t.decimal :minimum_monthly_fee, null: false

      t.timestamps
    end
  end
end
