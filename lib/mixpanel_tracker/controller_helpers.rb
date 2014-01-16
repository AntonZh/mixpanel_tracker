module MixpanelTracker
  module ControllerHelpers
    def track_event(name)
      session[:mixpanel_events] = name
    end
  end
end
