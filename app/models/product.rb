class Product < ActiveRecord::Base
  attr_accessible :name, :value, :color_id, :finish_id, :active
  validates_presence_of :value, :color_id, :finish_id
  belongs_to :color
  belongs_to :finish
end
