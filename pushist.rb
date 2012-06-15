require 'sinatra'
require 'json'
require 'yaml'
require_relative('wedoist/auth')
require_relative('wedoist/api')

get '/' do
  'Get github to POST to /listen'
end

get '/listen' do
  # push = JSON.parse(params[:payload])
  # # content = Parser
  # login_response = Wedoist.login(
  # "I got some JSON: #{push.inspect}"
  data = YAML.load_file('./config/config.yml')
  session = Auth.new(data['repository']['email'], data['repository']['password'])
  session.do_auth

  project_id = data['repository']['project']
  content = "hello world" 

  add_status = StatusAdd.new(project_id, content, session.get_cookies)
  response = add_status.call
end
