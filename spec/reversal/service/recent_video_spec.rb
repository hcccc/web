require 'rails_helper'

module Service
  describe RecentVideo do
    describe '.find_by_game' do
      before do
        @conditions = [1, 2]
        @condition_to_videos1 = [build(:video), build(:video)]
        @condition_to_videos2 = [build(:video), build(:video)]
        allow(RecentVideo).to receive(:find_by_condition).with(@conditions[0]).and_return(@condition_to_videos1)
        allow(RecentVideo).to receive(:find_by_condition).with(@conditions[1]).and_return(@condition_to_videos2)

        @game = Game.new
        allow(@game).to receive(:search_conditions).and_return(@conditions)
      end

      it 'find_by_conditionに対してgame.search_conditionsを適応した結果をconcatしたVideoのリストが返ってくる' do
        expect(RecentVideo.find_by_game(@game)).to eq @condition_to_videos1.concat(@condition_to_videos2)
      end
    end

    describe '.find_by_condition' do
      before do
        hash = [
            {
                url: 'url1',
                title: 'video1',
                posted_at: Time.parse('2015-01-01 00:00:00 +0900')
            },
            {
                url: 'url2',
                title: 'video2',
                posted_at: Time.parse('2015-01-02 00:00:00 +0900')
            }
        ]
        allow(Api::Nicovideo::TagSearch).to receive(:exec).and_return(hash)

        @search_condition = build(:search_condition)
        @videos = RecentVideo.find_by_condition(@search_condition)
      end

      it 'Hashの数だけVideoが生成される' do
        expect(@videos.length).to eq 2
      end

      context '取得された1件目のVideoについて' do
        before do
          @video = @videos.first
        end

        it 'URLが正しいこと' do
          expect(@video.url).to eq 'url1'
        end

        it 'game_idが正しいこと' do
          expect(@video.game_id).to eq @search_condition.game_id
        end

        it 'video_siteが正しいこと' do
          expect(@video.video_site).to eq @search_condition.video_site
        end

        it 'タイトルが正しいこと' do
          expect(@video.title).to eq 'video1'
        end

        it '投稿日時が正しいこと' do
          expect(@video.posted_at).to eq Time.parse('2015-01-01 00:00:00 +0900')
        end
      end
    end
  end
end
