require_relative 'request'

#
# Authenticate a user and get cookie
# data:
#   email
#   password
#
class Auth
  def initialize(email, password, uri="https://wedoist.com/API/Users/login")
    @email = email
    @password = password
    @uri = uri
    @cookies = nil
  end

  def do_auth
    post_data = {'email' => @email, 'password' => @password}
    request = Request.new(@uri, post_data)
    result = request.send_post
    @cookies = result['Set-Cookie']

    return result
  end

  def get_cookies
    return @cookies
  end
end
