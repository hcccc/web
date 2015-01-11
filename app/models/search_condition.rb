class SearchCondition < ActiveRecord::Base
  include ClassyEnum::ActiveRecord

  belongs_to :game
  classy_enum_attr :video_site
end