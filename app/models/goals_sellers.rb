class GoalsSellers < ActiveRecord::Base
  attr_accessible :goal_id, :obtained_value, :user_id, :value  
  
  belongs_to :user 
  belongs_to :goal 
end
