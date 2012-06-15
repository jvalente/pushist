require 'sinatra'
require 'json'

get '/' do
  'Get github to POST to /listen'
end

post '/listen' do
  push = JSON.parse(params[:payload])
  "I got some JSON: #{push.inspect}"
end
