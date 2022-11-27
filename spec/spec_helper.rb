require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'
require 'factory_bot'
require 'allure-rspec'

require_relative 'utils/database'
require_relative 'utils/factories'
require_relative 'services/user'

RSpec.configure do |config|
 
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.include FactoryBot::Syntax::Methods

  config.before :all do
    Database.new.clean_db
  end
end

### Config Allure Results
AllureRspec.configure do |config|
  config.results_directory = "result/allure_results"
  config.clean_results_directory = true
  config.logging_level = Logger::INFO
end
