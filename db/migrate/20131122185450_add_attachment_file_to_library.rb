class AddAttachmentFileToLibrary < ActiveRecord::Migration
  def self.up
    add_column :libraries, :file_file_name, :string
    add_column :libraries, :file_content_type, :string
    add_column :libraries, :file_file_size, :integer
    add_column :libraries, :file_updated_at, :datetime
  end

  def self.down
    remove_column :libraries, :file_file_name
    remove_column :libraries, :file_content_type
    remove_column :libraries, :file_file_size
    remove_column :libraries, :file_updated_at
  end
end
