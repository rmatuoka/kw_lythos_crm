class LibraryCategory < ActiveRecord::Base
  attr_accessible :name
  has_many :libraries
end
