class AddItensToLibrary < ActiveRecord::Migration
  def change
    add_column :libraries, :library_category_id, :integer
  end
end
