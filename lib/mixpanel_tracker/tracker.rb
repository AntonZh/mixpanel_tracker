require 'mixpanel_tracker/event'

module MixpanelTracker
  class Tracker
    def initialize(session)
      raise(ArgumentError, "No session provided") unless session

      @session = session
    end

    def track(event_name, args = {})
      queue_event Event.new(event_name, args)
      true
    end

    private

    def queue_event(event)
      if @session
        @session[:mixpanel_events] ||= []
        @session[:mixpanel_events] << event
      else
        puts "No session provided: event #{event.name} will not be tracked"
      end
    end
  end
end
