class Library < ActiveRecord::Base
  attr_accessible :name, :file, :library_category_id
  
  has_attached_file :file
  
  belongs_to :library_category
end
