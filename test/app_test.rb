require 'test/unit'
require 'rack/test'
require './test/test_helper'
require './app'

# Russa test suite
class RussaTest < Test::Unit::TestCase
  include Rack::Test::Methods
  
  def app
    Russa.new
  end

  def test_root_is_ok
    get '/'
    assert last_response.ok?
    assert_equal JSON.parse(last_response.body)['message'], "upload service is running"
  end

  def test_upload_get
    get '/upload'
    assert last_response.status, '404'
    assert_equal JSON.parse(last_response.body)['message'], "File not found"
  end

  def test_upload_post
    post '/upload', file: Rack::Test::UploadedFile.new("test/files/mary.jpg", "image/jpeg")
    assert last_response.ok?
    assert_not_empty JSON.parse(last_response.body)['file']
  end

  def test_not_found_page
    get '/spoon_of_sugar'
    assert last_response.status, '404'
    assert_equal JSON.parse(last_response.body)['message'], "Page not found"
  end
  
end
