$LOAD_PATH << File.dirname(__FILE__)

require 'app'

App.set :run, false

use Rack::Deflater
use Rack::ETag

if ENV['RACK_ENV'] == 'development'
  require 'rack-livereload'
  use Rack::LiveReload
end

run App
