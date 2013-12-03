class Guest < ActiveRecord::Base
  has_many :items
  # attr_accessible :name
  attr_protected
  validates_presence_of :email, :name
  validates :email, uniqueness: {scope: :event_id, message: " is already a guest of this event."}
  validates_format_of :email, :with => /.+@.+\..*{4}/, :on => :create
end