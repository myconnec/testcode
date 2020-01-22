Aws.config.update({
    region: ENV['AWS_META_DATA_REGION'],
    credentials: Aws::InstanceProfileCredentials.new()
})

# ssm_client = Aws::SSM::Client.new(region: ENV['AWS_META_DATA_REGION'])

# name = ssm_client.get_parameter(
#     name: '/name',
#     with_decryption: true
# ).to_h

# puts name[:parameter][:value]
