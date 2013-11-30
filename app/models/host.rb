class Host < ActiveRecord::Base
  has_many :events
  # attr_accessible :name
  attr_protected
  has_secure_password

end