module MixpanelTracker
  class Configuration
    attr_accessor :access_token, :register_utm_params, :enabled

    def initialize
      enabled = true
    end

    def disabled?
      enabled == false
    end
  end
end
