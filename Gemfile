source 'https://rubygems.org'

gem 'rake'
gem 'sinatra'
gem 'sinatra-contrib', :require => "sinatra/contrib/all"
gem 'pg'
gem 'unicorn'

gem 'sprockets'
gem 'sprockets-sass'
gem 'sass'
gem 'compass'
gem 'bootstrap-sass'

group :production do
  gem 'zhconv', :github => 'zxlai/zhconv'
end

group :development, :test do
  gem 'guard'
  gem 'guard-livereload', require: false
  gem 'guard-shell'
  gem 'guard-rspec'
  gem 'rb-fsevent'
  gem 'zhconv', :path => '/Users/gary/Documents/works/zhconv'
end
