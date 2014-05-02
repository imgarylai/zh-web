# app.rb
require 'sinatra'
require 'zhconv'
require 'bundler'
ENV['RACK_ENV'] = 'development' unless ENV['RACK_ENV']
Bundler.require(:default, ENV['RACK_ENV'])

class App < Sinatra::Base

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

  get '/result' do
    source = params[:source]
    @ori = "#{source}"
    # p "Before convert"
    # p "Source: #{source}, id: #{source.object_id}"
    # p "@ori: #{@ori}, id: #{@ori.object_id}"
    @result = convert(source)
    # p "After convert"
    # p "Source: #{source}, id: #{source.object_id}"
    # p "@ori: #{@ori}, id: #{@ori.object_id}"
    erb :result
  end

  def convert(source)
    ZhConv.convert("zh-tw", source)
  end

end
