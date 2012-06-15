require 'uri'
require 'net/http'

#
# Perform HTTP requests
#
class Request
  def initialize(uri, post_data, cookies=nil)
    @uri = uri
    @post_data = post_data
    @cookies = cookies
  end

  
  def send_post
    uri = URI(@uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
  
    # Debug the request flow
    # http.set_debug_output $stderr

    response = http.start do |h|
      request = Net::HTTP::Post.new(uri.path)
      request.set_form_data(@post_data)
      if @cookies
        request['cookie'] = @cookies
      end
      http.request(request) 
    end

    return response 
  end
end
