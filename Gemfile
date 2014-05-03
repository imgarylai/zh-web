source 'https://rubygems.org'

ruby "2.1.0"

gem 'rake'
gem 'sinatra'
gem 'sinatra-contrib', :require => "sinatra/contrib/all"
gem 'sinatra-assetpack'
gem 'pg'
gem 'unicorn'
gem 'foreman'
gem 'rack-livereload'
gem 'json'

gem 'sprockets'
gem 'sprockets-sass'
gem 'sass'
gem 'compass'
gem 'bootstrap-sass'

group :development, :test do
  gem 'guard'
  gem 'guard-livereload', require: false
  gem 'guard-shell'
  gem 'guard-rspec'
  gem 'rb-fsevent'
end

if ENV['RACK_ENV'] == "development"
  gem 'zhconv', :path => '/Users/gary/Documents/works/zhconv'
else
  gem 'zhconv', :github => 'zxlai/zhconv'
end
