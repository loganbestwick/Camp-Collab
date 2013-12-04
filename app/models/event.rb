class Event < ActiveRecord::Base
  attr_protected
  has_many :guests
  has_many :items
  validates_presence_of :name, :address

  geocoded_by :address
  after_validation :geocode
end