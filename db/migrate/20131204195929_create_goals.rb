class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.decimal :value, :precision => 10, :scale => 2, :default => 0 
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
