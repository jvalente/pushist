require_relative 'request'

#
# Perform generic class to Wedoist API
#
class Api
  def initialize(uri, post_data, cookies)
    @uri = uri
    @post_data = post_data
    @cookies = cookies
  end

  def call
    request = Request.new(@uri, @post_data, @cookies)
    response = request.send_post

    return response
  end
end

#
# POST /API/Statuses/add
# data:
#   project_id
#   content
#   type_id (not implemented)
#
class StatusAdd < Api
  def initialize(project_id, content, cookies, uri='https://wedoist.com/API/Statuses/add')
    post_data = {'project_id' => project_id, 'content' => content}
    super(uri, post_data, cookies)
  end
end
