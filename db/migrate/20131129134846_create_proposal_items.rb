class CreateProposalItems < ActiveRecord::Migration
  def change
    create_table :proposal_items do |t|
      t.integer :proposal_id
      t.integer :quantity
      t.decimal :value, :precision => 10, :scale => 2, :default => 0
      t.string :product

      t.timestamps
    end
  end
end
