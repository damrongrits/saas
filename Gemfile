source 'http://rubygems.org'

ruby '1.9.3'
gem 'net-ssh', '~> 2.0'
gem 'rails', '3.2.18'
gem 'haml'
gem 'omniauth-facebook'
gem 'minitest', '~> 4.7.5'
gem 'themoviedb'
gem 'jquery-rails'
gem 'heroku'

group :development, :test do
  gem 'jasmine', '~> 1.3', '>= 1.3.2'
  gem 'jasmine-jquery-rails'
  gem 'simplecov', :require => false
  gem 'debugger'
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels' # some pre-fabbed step definitions
  gem 'database_cleaner' # to clear Cucumber's test database between runs
  gem 'capybara'         # lets Cucumber pretend to be a web browser
  gem 'launchy'          # a useful debugging aid for user stories
  gem 'railroady'
  gem 'sqlite3'
end

group :production do
#  gem 'pg'
  gem 'rails_12factor'
end

group :test do
  gem 'rspec-rails'
  gem 'autotest-rails'
  # gem 'ZenTest', '4.8.3'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
