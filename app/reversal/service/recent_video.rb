module Service
  class RecentVideo
    class << self
      # @param game [Game]
      # @return [Array<Video>]
      def self.find_by_game(game)
        game.search_conditions.flat_map do |condition|
          find_by_condition(condition)
        end
      end

      # @param condition [SearchCondition]
      # @return [Array<Video>]
      def find_by_condition(condition)
        Api::Nicovideo::TagSearch.exec(condition.keyword).map do |hash|
          Video.new(
              url: hash[:url],
              game_id: condition.game_id,
              video_site: condition.video_site.to_sym,
              title: hash[:title],
              posted_at: hash[:posted_at]
          )
        end
      end
    end
  end
end
