require 'rails/generators'
require 'rails/generators/named_base'

module MixpanelTracker
  module Generators
    class MixpanelTrackerGenerator < ::Rails::Generators::Base
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      argument :access_token, :type => :string, :banner => 'access_token', :default => :use_env_sentinel

      def create_initializer
        say "Creating mixpanel_tracker initializer..."
        if access_token_configured?
          say "It looks like you've already configured mixpanel_tracker."
          say "To re-create the config file, remove it first: config/initializers/mixpanel_tracker.rb"
          exit
        end

        if access_token === :use_env_sentinel
          say "Generator run without an access token; assuming you want to configure using an environment variable."
          say "You'll need to add an environment variable MIXPANEL_ACCESS_TOKEN with your access token:"
          say "\n$ export MIXPANEL_ACCESS_TOKEN=yourtokenhere"
          say "\nIf that's not what you wanted to do:"
          say "\n$ rm config/initializers/mixpanel_tracker.rb"
          say "$ rails generate mixpanel_tracker yourtokenhere"
          say "\n"
        else
          say "mixpanel_tracker access token: " << access_token
        end

        template 'initializer.rb', 'config/initializers/mixpanel_tracker.rb',
          :assigns => { :access_token => access_token_expr }
      end

      def access_token_expr
        if access_token === :use_env_sentinel
          "ENV['MIXPANEL_ACCESS_TOKEN']"
        else
          "'#{access_token}'"
        end
      end

      def access_token_configured?
        File.exists?('config/initializers/mixpanel_tracker.rb')
      end
    end
  end
end
