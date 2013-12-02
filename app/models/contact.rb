class Contact < ActiveRecord::Base
  attr_accessible :address, :cellphone, :city, :cpf_cnpj, :email, :name, :obs, :phone, :state, :user_id

  has_many :proposals
  
  belongs_to :user
end
