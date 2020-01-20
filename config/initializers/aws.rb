puts ENV['META_DATA']["region"]
abort("She cannot take any more of this, Captain!")

# Aws.config.update({
#     # region: ENV['AWS_REGION'],
#     # credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY'], ENV['AWS_SECRET_KEY'])
#     region: 'us-west-2',
#     credentials: Aws::InstanceProfileCredentials.new()
# })

# AWS_S3_MEDIA_SOURCE_BUCKET = Aws::S3::Resource.new.bucket(ENV['AWS_S3_MEDIA_SOURCE_BUCKET'])

# AWS_S3_MEDIA_DISPLAY_BUCKET = Aws::S3::Resource.new.bucket(ENV['AWS_S3_MEDIA_DISPLAY_BUCKET'])

# res_data = `curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document`.to_s
# region = JSON.parse(res_data.to_s)["region"]

# ## read SSM parameters

# ssm_client = Aws::SSM::Client.new(region: region)

# name = ssm_client.get_parameter(
#     name: '/name',
#     with_decryption: true
# ).to_h
# puts name[:parameter][:value]


# # region = ssm_client.get_parameter(
# #     name: '/region',
# #     with_decryption: true
# # ).to_h
# # puts region[:parameter][:value]


# # puts ssm_client.get_parameter(name: '/region', with_decryption: true).to_h[:parameter][:value]
# # puts region[:parameter][:value]

# ## end

# # abort("She cannot take any more of this, Captain!")
