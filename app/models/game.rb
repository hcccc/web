class Game < ActiveRecord::Base
  has_many :search_conditions

  # @return [String]
  def self.config_dir
    "#{Rails.root}/config/auth/"
  end

  # @return [Hash{String => String}]
  def auth_config
    YAML::load_file(self.config_dir + auth_config_file)
  end
end
