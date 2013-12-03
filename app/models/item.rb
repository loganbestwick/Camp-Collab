class Item < ActiveRecord::Base
  # attr_accessible :name, :price
  attr_protected
  validates_presence_of :name
  belongs_to :guest
end
