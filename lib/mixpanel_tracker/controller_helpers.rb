module MixpanelTracker
  class ControllerHelpers
    def track_event(name)
      session[:mixpanel_events] = name
    end
  end
end
