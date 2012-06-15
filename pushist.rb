require 'sinatra'
require 'json'
require 'yaml'
require_relative 'wedoist/auth'
require_relative 'wedoist/api'
require_relative 'github/parser'

get '/' do
  'Get github to POST to /listen'
end

post '/listen' do
  payload = GHPayload.new(JSON.parse(params[:payload]))

  data = YAML.load_file('./config/config.yml')[payload.get_project]
  content = payload.print
  
  session = Auth.new(data['email'], data['password'])
  session.do_auth

  project_id = data['project']

  add_status = StatusAdd.new(project_id, content, session.get_cookies)
  response = add_status.call
end
