class CreateLibraryCategories < ActiveRecord::Migration
  def change
    create_table :library_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
