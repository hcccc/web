module Batch
  class UpdateVideos
    def self.exec
      recent_videos = Game.all.flat_map do |game|
        Service::RecentVideo.find_by_game(game)
      end

      unsaved_videos = recent_videos.select do |video|
        !Video.exists?(url: video.url)
      end

      unsaved_videos.each do |video|
        video.save
      end
    end
  end
end