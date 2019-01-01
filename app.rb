require './apps/ping'
require './apps/upload_service'

# Rack Upload Service Sample App
# A simple upload service
class Russa

  def initialize
    @app = Rack::Builder.new do
      map '/' do
        run Ping.new
      end

      map '/upload' do
        run UploadService.new
      end
    end
  end

  def call(env)
    @app.call(env)
  end
end
