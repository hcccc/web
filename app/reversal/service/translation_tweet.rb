module Service
  class TranslationTweet
    # @param video [Video]
    # @return [String]
    def self.alert_posted(video)
      "\"#{video.title}\" - #{video.url} が投稿されました"
    end
  end
end