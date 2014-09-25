require 'credit_card_tools'

require 'rubygems'
require 'bundler'
Bundler.setup(:default, :test, :development)

require 'pry'

RSpec.configure do |config|
  config.mock_with :rspec
  config.run_all_when_everything_filtered = true
end

