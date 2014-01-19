module MixpanelTracker
  class Configuration
    attr_accessor :access_token, :register_utm_params, :enabled

    def initialize
      enabled = true
    end
  end
end
