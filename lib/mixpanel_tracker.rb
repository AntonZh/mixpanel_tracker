require 'mixpanel_tracker/configuration'
require 'mixpanel_tracker/tracker'
require 'mixpanel_tracker/railtie'

module MixpanelTracker
  class << self
    attr_writer :configuration

    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
