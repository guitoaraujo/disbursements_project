class AddWeekdayToMerchant < ActiveRecord::Migration[7.0]
  def change
    add_column :merchants, :weekday, :integer, null: false
  end
end
