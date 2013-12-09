module API
  module Configuration
    def self.extended(base)
      base.configure
    end

    SETTING_KEYS =[
      :consumer_key,
      :consumer_secret,
      :oauth_token,
      :oauth_token_secret,
      :subdomain,
      :app_url,
      :user_agent,
      :api_version,
      :api_root,
      :api_url
    ]

    attr_accessor *SETTING_KEYS

    def configure
      # This should be moved to a file which is excluded from source control and sets an ENV variable
      self.app_url            = 'http://desk-cases-dashboard.herokuapp.com/'
      self.user_agent         = "Cases Dashboard v1.0.0"
      self.consumer_key       = '1w9es6XvTRzMZNdDz0ie'
      self.consumer_secret    = 'GaauWBN2D4cFgIGK2oE9w74mbsb3k0gUXWKEsQO3'
      self.oauth_token        = 'jTySAmrhxNbDEEd1Cg0c'
      self.oauth_token_secret = 'jeLToeGul9UpO420Bs0z0f9LqDF0NqT1PPTh59Ri'
      self.subdomain          = 'carlockinc'
      self.api_version        = '2'
      self.api_root           = "https://#{self.subdomain}.desk.com"
      self.api_url            = "#{self.api_root}/api/v#{self.api_version}"
    end
  end
end