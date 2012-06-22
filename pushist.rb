require 'sinatra'
require 'json'
require 'yaml'
require_relative 'wedoist/auth'
require_relative 'wedoist/api'
require_relative 'github/parser'
require_relative 'message/message'

get '/' do
  'Get github to POST to /listen'
end

post '/listen' do
  # Parse github message
  payload = GHPayload.new(JSON.parse(File.read('json')))
  
  # load configs based on the repo that received the push
  data = YAML.load_file('./config/config.yml')[payload.project]

  # setup message based on specified template or default
  message = Message.new(data['template'], payload)
 
  # auth with Wedoist
  session = Auth.new(data['email'], data['password'])
  session.do_auth

  # send the request
  add_status = StatusAdd.new(data['project'], message.print, session.get_cookies)
  response = add_status.call
end
