require 'twitter'

module Api
  module Twitter
    class Tweet
      class << self
        # @param text [String]
        # @param config [Hash{String => String}]
        def exec(text, config)
          client(config).update(text)
        end

        private

        # @param config [Hash{String => String}]
        # @return [Twitter::REST::Client]
        def client(config)
          ::Twitter::REST::Client.new do |conf|
            conf.consumer_key        = config['consumer_key']
            conf.consumer_secret     = config['consumer_secret']
            conf.access_token        = config['access_token']
            conf.access_token_secret = config['access_token_secret']
          end
        end
      end
    end
  end
end
