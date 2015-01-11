require 'rss'

module Api
  module Nicovideo
    class TagSearch
      class << self
        # @param tag [String]
        # @return [Hash{Symbol => String, Time}]
        def exec(tag)
          items(rss_url(tag)).map do |item|
            {
                url: item.link,
                title: item.title,
                posted_at: item.pubDate
            }
          end
        end

        private

        # @param tag [String]
        def rss_url(tag)
          'http://www.nicovideo.jp/tag/' + tag + '?sort=f&rss=2.0'
        end

        # @param url [String]
        def items(url)
          RSS::Parser.parse(url, true).channel.items.reverse
        end
      end
    end
  end
end
