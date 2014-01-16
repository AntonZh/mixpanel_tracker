module MixpanelTracker
  module ControllerHelpers
    def track_event(name, options = {})
      session[:mixpanel_events] ||= []
      session[:mixpanel_events] << { name: name, options: options }
    end
  end
end
