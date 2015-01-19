require 'factory_girl'
require 'webmock/rspec'
require 'coveralls'
require 'codeclimate-test-reporter'

formatters = [SimpleCov::Formatter::HTMLFormatter]

WebMock.disable_net_connect!(:allow => ['coveralls.io', 'codeclimate.com'])
formatters << Coveralls::SimpleCov::Formatter if ENV['COVERALLS_REPO_TOKEN']
formatters << CodeClimate::TestReporter::Formatter if ENV['CODECLIMATE_REPO_TOKEN']

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[*formatters]
SimpleCov.start 'rails'

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(File.join(fixture_path, file))
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  RSpec.configure do |config|
    config.include FactoryGirl::Syntax::Methods
  end
end
