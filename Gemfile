source 'http://rubygems.org'

gem 'rails', '3.1.1'

gem 'thin'
     
gem 'twitter-bootstrap-rails', "~> 2.0rc0",:group => :assets

# heroku uses PostgreSQL
group :production do
  gem 'pg'
  gem 'therubyracer'
end

group :development, :test do
  gem 'sqlite3'
end

#1.3.4 has a annoying warning
gem "rack", "1.3.3" 

gem "devise", ">= 1.4.7"

group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

gem "zurb-foundation"

gem 'jquery-rails'
