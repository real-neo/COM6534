Airbrake.configure do |config|
  config.api_key = 'fc4db486dfd77b274354ea9a3afb0398'
  config.host    = 'errbit.genesys.shefcompsci.org.uk'
  config.port    = 443
  config.secure  = config.port == 443
end