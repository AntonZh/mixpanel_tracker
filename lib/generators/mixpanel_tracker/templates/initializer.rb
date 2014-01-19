MixpanelTracker.configure do |config|
  # Your access token
  config.access_token = <%= access_token_expr %>

  # Register UTM params automatically
  config.register_utm_params = true

  # Disable in development and test environments
  if Rails.env.test? or Rails.env.development?
    config.enabled = false
  end
end
