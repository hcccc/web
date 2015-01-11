module Service
  class AlertPosted
    # @param video [Video]
    def self.tweet(video)
      text = TranslationTweet.alert_posted(video)
      Api::Twitter::Tweet.exec(text, video.game.auth_config)
    end
  end
end
