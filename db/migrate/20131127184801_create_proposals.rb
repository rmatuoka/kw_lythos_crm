class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.integer :contact_id
      t.string :email
      t.string :cc
      t.string :address
      t.string :number
      t.string :city
      t.string :state
      t.string :postal_code
      t.integer :status

      t.timestamps
    end
  end
end
