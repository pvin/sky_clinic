class AddAccessoriesPriceToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :accessories_price, :text
  end
end
