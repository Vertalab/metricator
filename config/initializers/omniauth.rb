Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :intercom, Rails.application.secrets.INTERCOM_KEY, Rails.application.secrets.INTERCOM_SECRET
end
