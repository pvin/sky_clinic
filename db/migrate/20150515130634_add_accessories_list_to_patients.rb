class AddAccessoriesListToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :accessories_list, :text
  end
end
