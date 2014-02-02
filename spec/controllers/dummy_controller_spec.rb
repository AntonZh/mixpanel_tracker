require 'spec_helper'

describe DummyController do
  it 'has access to mixpanel tracker' do
    get :index

    expect(assigns(:tracker).class).to eq(MixpanelTracker::Tracker)
  end

  it 'can put events in tracking queue' do
    get :track_event

    expect(session[:mixpanel_events].length).to eq(1)
  end

  it 'not loosing events on redirects' do
    get :track_event_and_redirect

    expect(session[:mixpanel_events].first.class).to eq(MixpanelTracker::Event)
  end
end
