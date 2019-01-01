require './config/shrine'
require 'image_processing/mini_magick'

# FileUpload Shrine DSL
class FileUploader < Shrine
  plugin :processing # allows hooking into promoting
  plugin :versions   # enable Shrine to handle a hash of files
  plugin :delete_raw # delete processed files after uploading
end