require 'json'
require './uploaders/file_uploader'

# Handle with upload files
class UploadService

  def initialize
    @uploader = FileUploader.new(:store)
  end
  
  def call(env)
    request = Rack::Request.new(env)

    if request.post?
      uploaded_file = upload(request.params['file'])
      body = JSON.generate({ file: uploaded_file.data })
      return [ 200, { 'Content-Type' => 'application/json' }, [ body ] ]
    else
      body = JSON.generate({ message: 'File not found' })
      return [ 404,  { 'Content-Type' => 'application/json' }, [ body ] ]
    end
  end

  def upload(file_param)
    file = Shrine.rack_file(file_param)
    return @uploader.upload(file)
  end

end

