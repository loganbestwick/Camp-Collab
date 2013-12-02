class Event < ActiveRecord::Base
  attr_protected
  # attr_accessible :name
  has_many :guests
  has_many :items
  validates_presence_of :name
end