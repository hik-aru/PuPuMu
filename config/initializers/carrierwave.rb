CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAJS5DUN6ZAOM7NX5A',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }
  
    config.fog_directory  = 'rails-app-pupumo'
    config.cache_storage = :fog
  end