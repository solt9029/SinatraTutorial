require 'sinatra'
require 'sinatra/reloader'

get '/' do
  'test'
end

get '/path/to' do
  "this is [/path/to]"
end

get '/hello/*' do |name|
  "hello #{name}. how are you?"
end

get '/erb_template_page' do
  erb :erb_template_page
end

get '/markdown_template_page' do
  markdown :markdown_template_page
end

get '/times' do
  erb :times
end

get '/send_value' do
  @msg = 'hello message'
  erb :send_value
end

get '/article/:id' do
  id = params[:id]
  # idが整数かどうか確かめる
  if id.to_i.to_s == id.to_s then
    @id = id
    erb :article
  else
    'param is not integer'
  end
end