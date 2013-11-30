class Host < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :first_name, :last_name, :password, :username
end
