class Event < ActiveRecord::Base
  attr_protected
  has_many :guests
  has_many :items
  belongs_to :host
  validates_presence_of :name, :address
  after_validation :geocode
  geocoded_by :address
end