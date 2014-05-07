# app.rb
require 'sinatra'
require 'sinatra/assetpack'
require 'zh'
require 'bundler'
require 'json'

ENV['RACK_ENV'] = 'development' unless ENV['RACK_ENV']
Bundler.require(:default, ENV['RACK_ENV'])

class App < Sinatra::Base

  helpers Sinatra::JSON

  register Sinatra::AssetPack

  set :views, settings.root + '/app/views'
  set :erb, :format => :html5

  configure do
    env = ENV['RACK_ENV'] || 'development'
    enable :logging
    enable :raise_errors

    set :root, File.dirname(__FILE__)
  end

  configure :development do |config|
    require "sinatra/reloader"
    register Sinatra::Reloader
    enable :show_exceptions
  end

  assets do

    serve '/js', :from => 'app/assets/javascripts'
    js :application, [
      '/js/*.js',
      # You can also do this: 'js/*.js'
    ]

    serve '/css', :from => 'app/assets/stylesheets'
    css :application, [
      '/css/app.css'
     ]

    js_compression :jsmin
    css_compression :sass
  end

  get '/' do
    erb :index, :layout => :application
  end

  post '/result' do
    source = params[:source]
    @ori = "#{source}"
    @result = {:source => @ori, :result => convert(source) }
    content_type :json, :charset => 'utf-8'
    @result.to_json
  end

  def convert(source)
    Zh.to_tw source
  end

end
