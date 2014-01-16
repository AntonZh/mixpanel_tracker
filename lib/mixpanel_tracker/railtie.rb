require 'mixpanel_tracker/view_helpers'
require 'mixpanel_tracker/controller_helpers'
require 'rails'

module MixpanelTracker
  class Railtie < Rails::Railtie
    initializer 'mixpanel_tracker.view_helpers' do
      ActionView::Base.send :include, ViewHelpers
    end

    initializer 'mixpanel_tracker.controller_helpers' do
      ActionController::Base.send :include, ControllerHelpers
    end
  end
end
