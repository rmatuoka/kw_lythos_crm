class AddCollaboratorsAndUser < ActiveRecord::Migration
  def up  
    create_table :collaborators_users do |t|
      t.integer :user_id
      t.integer :collaborator_id
      t.timestamps
    end
  end

  def down 
    drop_table :collaborators_users
  end
end
