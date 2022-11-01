require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'
require 'factory_bot'
require 'allure-rspec'

require_relative './utils/database'
require_relative 'factories'
require_relative 'services/user'

@rspec_yaml = YAML.load_file("#{Dir.pwd}/spec/support/rspec.yaml")
@ambiente = @rspec_yaml[ambiente]


CONFIG = YAML.load_file("#{Dir.pwd}/spec/support/data/#{@ambiente}.yml")

AllureRspec.configure do |c|
  c.result_directory = 'report/allure-results'
  c.clead_result_directory = true
end


RSpec.configure do |config|
 
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.include FactoryBot::Syntax::Methods
end
