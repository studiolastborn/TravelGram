if Rails.env.production?
  CarrierWave.configure do |config|
    config.aws_credentials = {
      :aws_access_key_id => ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET_KEY'],
      :region => 'Seoul'
      
    }
      config.storage    = :aws
      config.aws_bucket = ENV['S3_BUCKET']
  end
end