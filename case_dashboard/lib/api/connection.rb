module API
  module Connection
    def self.extended(base)
      base.configure
    end

    attr_accessor :connection

    def configure
      consumer = OAuth::Consumer.new(
        API::Client.consumer_key,
        API::Client.consumer_secret,
        site: API::Client.api_root,
        scheme: :header
      )

      self.connection = OAuth::AccessToken.from_hash(
        consumer,
        oauth_token: API::Client.oauth_token,
        oauth_token_secret: API::Client.oauth_token_secret
      )
    end
  end
end