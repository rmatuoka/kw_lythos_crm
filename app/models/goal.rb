class Goal < ActiveRecord::Base
  attr_accessible :end, :start, :value, :sellers  
  attr_accessor :sellers
  has_many :goals_sellers 
end
