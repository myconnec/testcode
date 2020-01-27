Aws.config.update({
    region: ENV['AWS_META_DATA_REGION'],
    credentials: Aws::InstanceProfileCredentials.new()
})

AWS_S3_MEDIA_SOURCE_BUCKET = Aws::S3::Resource.new.bucket(ENV['AWS_S3_MEDIA_SOURCE_BUCKET'])

AWS_S3_MEDIA_DISPLAY_BUCKET = Aws::S3::Resource.new.bucket(ENV['AWS_S3_MEDIA_DISPLAY_BUCKET'])
