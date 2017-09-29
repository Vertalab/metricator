Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :intercom, ENV['INTERCOM_KEY'], ENV['INTERCOM_SECRET']
end
