require 'rubygems'
require 'pry'
require 'coveralls'

Coveralls.wear!

ENV['RAILS_ENV'] = 'test'
require File.expand_path('../dummy/config/environment', __FILE__)

require 'rspec/rails'
require 'genspec'

load 'spec/dummy/Rakefile'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter = 'documentation'

  config.use_transactional_fixtures = true
  config.order = "random"
end

def test_token
  'qwerty123456'
end
