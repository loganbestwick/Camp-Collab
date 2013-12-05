source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'gmaps4rails'
gem 'geocoder'
gem 'mandrill-rails'
gem 'mail'
gem 'pickadate-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem "less-rails"
  gem 'twitter-bootstrap-rails'
  gem 'therubyracer'

end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
 gem 'bcrypt-ruby', '~> 3.0.0'


group :test, :development do
  gem "rspec-rails", "~> 2.0"
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'simplecov', :require => false, :group => :test
  gem 'selenium-webdriver'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
end

group :production do
  gem 'rails_12factor'
end
# gem 'rails_12factor', group: :production
