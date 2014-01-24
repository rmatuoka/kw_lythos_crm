class CreateGoalsSellers < ActiveRecord::Migration
  def change
    create_table :goals_sellers do |t|
      t.integer :goal_id
      t.integer :user_id
      t.decimal :value, :precision => 10, :scale => 2, :default => 0    
      t.decimal :obtained_value, :precision => 10, :scale => 2, :default => 0    

      t.timestamps
    end
  end
end
