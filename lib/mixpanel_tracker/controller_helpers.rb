module MixpanelTracker
  module ControllerHelpers
    extend ActiveSupport::Concern

    included do
      helper_method :mixpanel
      def mixpanel
        s = session rescue nil
        @mixpanel_tracker ||= MixpanelTracker::Tracker.new(s)
      end
    end
  end
end
