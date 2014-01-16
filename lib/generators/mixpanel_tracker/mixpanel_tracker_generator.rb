require 'rails/generators'

module MixpanelTracker
  module Generators
    class MixpanelTrackerGenerator < ::Rails::Generators::Base
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      def create_initializer
        template 'initializer.rb', 'config/initializers/mixpanel_tracker.rb'
      end
    end
  end
end
