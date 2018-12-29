require "test/unit"
require "rack/test"
require_relative '../app'

class RussaTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    app = Russa.new
    builder = Rack::Builder.new
    builder.run app
  end

  def test_root_is_ok
    get '/'
    assert last_response.ok?
    assert_equal last_response.body, '{"hello":"world"}'
  end

  def test_not_found_page
    get '/spoon_of_sugar'
    assert last_response.status, '404'
    assert_equal last_response.body, '{"message":"Not found"}'
  end
  
end
