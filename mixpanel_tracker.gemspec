require 'mixpanel_tracker/version'

Gem::Specification.new do |s|
  s.name        = 'mixpanel_tracker'
  s.version     = MixpanelTracker::VERSION
  s.platform    = Gem::Platform::RUBY
  s.date        = '2013-01-16'
  s.summary     = 'Mixpanel event tracker for Rails'
  s.description = 'Mixpanel event tracker for Rails'
  s.authors     = 'Anton Zhavoronkov'
  s.email       = 'anton.zhavoronkov@gmail.com'
  s.files       = ['lib/mixpanel_tracker.rb', 'lib/mixpanel_tracker/version.rb']
  s.homepage    = 'http://rubygems.org/gems/mixpanel_tracker'
  s.license     = 'MIT'
end
