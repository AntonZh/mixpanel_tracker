require File.expand_path('../lib/mixpanel_tracker/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'mixpanel_tracker'
  gem.version     = MixpanelTracker::VERSION
  gem.platform    = Gem::Platform::RUBY
  gem.date        = '2013-01-16'
  gem.summary     = 'Mixpanel event tracker for Rails'
  gem.description = 'Declare events at controllers and they will be reported from views, easy.'
  gem.authors     = 'Anton Zhavoronkov'
  gem.email       = 'anton.zhavoronkov@gmail.com'
  gem.files       = `git ls-files`.split($\)
  gem.require_paths = ["lib"]
  gem.homepage    = 'http://rubygems.org/gems/mixpanel_tracker'
  gem.license     = 'MIT'
end
