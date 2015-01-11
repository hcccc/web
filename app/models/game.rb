class Game < ActiveRecord::Base
  has_many :search_conditions

  # @return [Hash{String => String}]
  def auth_config
    YAML::load_file(config_dir + auth_config_file)
  end

  # @return [String]
  def config_dir
    "#{Rails.root}/config/auth/"
  end
end
