# app.rb
require 'sinatra'
require 'zhconv'

set :views, settings.root + '/app/views'
set :erb, :format => :html5

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
