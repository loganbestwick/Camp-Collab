class Guest < ActiveRecord::Base
  has_many :items
  # attr_accessible :name
  attr_protected

end