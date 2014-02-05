class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.decimal :value, :precision => 10, :scale => 2, :default => 0  
      t.integer :color_id
      t.integer :finish_id
      t.boolean :active, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
