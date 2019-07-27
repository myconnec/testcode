Aws.config.update({
    region: ENV['AWS_REGION'],
    credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY'], ENV['AWS_SECRET_KEY'])
})

AWS_S3_MEDIA_SOURCE_BUCKET = Aws::S3::Resource.new.bucket(ENV['AWS_S3_MEDIA_SOURCE_BUCKET'])

AWS_S3_MEDIA_DISPLAY_BUCKET = Aws::S3::Resource.new.bucket(ENV['AWS_S3_MEDIA_DISPLAY_BUCKET'])
