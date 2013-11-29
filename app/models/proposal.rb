class Proposal < ActiveRecord::Base
  attr_accessible :address, :cc, :city, :contact_id, :email, :number, :postal_code, :state, :status
  
  has_many :proposal_items
end
