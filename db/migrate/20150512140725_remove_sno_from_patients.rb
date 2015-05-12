class RemoveSnoFromPatients < ActiveRecord::Migration
  def change
    remove_column :patients, :sno, :integer
  end
end
