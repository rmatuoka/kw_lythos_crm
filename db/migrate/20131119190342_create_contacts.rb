class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :cpf_cnpj
      t.string :address
      t.string :city
      t.string :state
      t.string :phone
      t.string :cellphone
      t.text :obs

      t.timestamps
    end
  end
end
