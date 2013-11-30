class Event < ActiveRecord::Base
  attr_accessible :name
  has_many :guests
  has_many :items
end