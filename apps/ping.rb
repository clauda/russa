# frozen_string_literal: true
require 'json'

# Home Page, send a ok message
class Ping

  def call(env)
    request = Rack::Request.new(env)
    if request.path == '/'
      body = JSON.generate({ message: 'upload service is running' })
      return [ 200, { 'Content-Type' => 'application/json' }, [ body ] ]
    else
      body = JSON.generate({ message: 'Page not found' })
      return [ 404,  { 'Content-Type' => 'application/json' }, [ body ] ]
    end
  end

end
