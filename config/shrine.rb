require "shrine"
require "shrine/storage/s3"

s3_options = {
  bucket:            "russa-development", # required
  access_key_id:     ENV['RUSSA_AWS_ACCESS_KEY'],
  secret_access_key: ENV['RUSSA_AWS_SECRET_ACCESS_KEY'],
  region:            "sa-east-1",
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
  store: Shrine::Storage::S3.new(**s3_options),
}

Shrine.plugin :cached_attachment_data
Shrine.plugin :restore_cached_data
Shrine.plugin :rack_file
Shrine.plugin :determine_mime_type
