require 'aws-sdk-s3'
# require 'shrine/testing'
require 'shrine/storage/memory'

s3 = Aws::S3::Client.new(stub_responses: true)
s3.stub_data(:list_buckets)

Shrine.storages = {
  cache: Shrine::Storage::Memory.new,
  store: Shrine::Storage::Memory.new,
}
