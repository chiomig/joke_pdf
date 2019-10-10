class AwsClient

  def initialize
    @client = Aws::S3::Resource.new(
      region: 'us-east-2',
      access_key_id: ENV["S3_ACCESS_KEY_ID"],
      secret_access_key: ENV["S3_SECRET_ACCESS_KEY"]
    )

    @current_time = Time.now
    @bucket_name = 'mvpdfsamples'
  end

  def upload(filename)
    obj = @client.bucket(@bucket_name).object("#{filename.split("/").last}")
    obj.put(body: File.read(filename))
    obj
  end

end
