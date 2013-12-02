class Event < ActiveRecord::Base
  attr_protected
  # attr_accessible :name
  has_many :guests
  has_many :items
  validates_presence_of :name
  #Guys, I think we should probably validate more than name.  I'd say at least a name, start and end datetime, etc.. Just a thought.
end