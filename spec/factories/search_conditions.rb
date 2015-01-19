FactoryGirl.define do
  factory :search_condition do
    sequence(:game_id) {|n| n}
    video_site VideoSite::Niconico
  end
end
