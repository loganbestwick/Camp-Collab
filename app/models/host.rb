class Host < ActiveRecord::Base
  has_many :events
  # attr_accessible :name
  attr_protected
  has_secure_password
  validates_presence_of :email, :password
  validates :email, uniqueness: {message: " has already been registered."}
  validates_format_of :email, :with => /.+@.+\..*{4}/, :on => :create
  validates_length_of :password, :minimum => 6
end