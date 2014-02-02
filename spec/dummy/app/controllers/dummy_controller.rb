class DummyController < ApplicationController
  def index
    @tracker = mixpanel
  end

  def track_event
    mixpanel.track 'Sample event'
  end

  def track_event_and_redirect
    mixpanel.track 'Sample event before redirect'

    redirect_to [:dummy, :index]
  end
end
