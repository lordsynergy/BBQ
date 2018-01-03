require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/google'
    config.fog_credentials = {
        provider:              'Google',
        google_storage_access_key_id:     ENV['GOOGLE_STORAGE_ACCESS_KEY'],
        google_storage_secret_access_key: ENV['GOOGLE_STORAGE_SECRET_KEY']
    }

    config.fog_directory = ENV['GOOGLE_STORAGE_BUCKET_NAME']
  end
end
