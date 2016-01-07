CarrierWave.configure do |config|

    CarrierWave.configure do |config|
      config.storage = :fog
    end

  config.fog_credentials = {
    :provider               => 'AWS',                             # required
    :aws_access_key_id      => 'AKIAIUWTQHX44RGBEMRA',            # required
    :aws_secret_access_key  => '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',     # required
    :region                 => 'ap-southeast-2'                        # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'coderfactorytemp'               # required
  #config.fog_host       = 'https://assets.example.com'           # optional, defaults to nil
  #config.fog_public     = false                                  # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
