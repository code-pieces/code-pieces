Rails.application.config.middleware.use OmniAuth::Builder do
  google_config = Rails.application.secrets.google
  github_config = Rails.application.secrets.github
  provider :google_oauth2, google_config['client_id'], google_config['client_secret']
  provider :github, github_config['client_id'], github_config['client_secret'], scope: 'user:email,user:follow'
end
