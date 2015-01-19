FactoryGirl.define do
  factory :video do
    sequence(:url) {|n| "url#{n}"}
    game_id 1
    video_site VideoSite::Niconico
    sequence(:title) {|n| "title#{n}"}
    posted_at Time.parse('2015-01-01 00:00:00 +0900')
  end
end
