Game.create!([
  {title: "GGXrd", auth_config_file: "ggxrd.yml"}
])
SearchCondition.create!([
  {game_id: 1, video_site: "niconico", keyword: "GGXrd"}
])
