class AddAttachmentToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :attachment, :string
  end
end
