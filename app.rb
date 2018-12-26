require 'json'

class Russa

  def call(env)
    response = Rack::Response.new
    response["Content-Type"] = "application/json"

    request = Rack::Request.new(env)
    case request.path
    when "/"
      response.write JSON.generate({ hello: 'world' })
    when "/upload"
      response.write JSON.generate({ message: 'upload successfully' })
    else
      response.status = 404
      response.write JSON.generate({ message: 'Not found' })
    end

    response.finish
  end

end