class AddCategoryToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :category, :string
  end
end
