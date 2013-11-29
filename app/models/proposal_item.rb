class ProposalItem < ActiveRecord::Base
  attr_accessible :product, :proposal_id, :quantity, :value
  
  belongs_to :proposal
end
