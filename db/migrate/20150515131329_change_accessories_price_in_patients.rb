class ChangeAccessoriesPriceInPatients < ActiveRecord::Migration
  def change
    change_column :patients, :accessories_price, :decimal, :precision => 30, :scale => 10
  end
end
