class AddAttachment1ToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :attachment1, :string
  end
end
