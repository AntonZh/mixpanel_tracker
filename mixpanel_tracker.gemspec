$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mixpanel_tracker/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.version     = MixpanelTracker::VERSION

  s.name        = "mixpanel_tracker"
  s.summary     = "Events tracker for Rails"
  s.description = "Allows you to track mixpanel events"

  s.homepage    = "https://github.com/AntonZh/mixpanel_tracker"

  s.license = "MIT"

  s.authors     = ["Anton Zhavoronkov"]
  s.email       = ["anton.zhavoronkov@gmail.com"]

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails', '~> 2.14.1'
  s.add_development_dependency 'genspec', '~> 0.2.8'
  s.add_development_dependency 'pry', '~> 0.9.12'
end
