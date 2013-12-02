class Proposal < ActiveRecord::Base
  attr_accessible :address, :cc, :city, :contact_id, :email, :number, :postal_code, :state, :status, :user_id
  
  has_many :proposal_items
  belongs_to :contact
  belongs_to :user
end
