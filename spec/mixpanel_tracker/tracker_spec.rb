require 'spec_helper'

describe MixpanelTracker::Tracker do
  it 'is initialized with session' do
    session = Hash.new

    tracker = MixpanelTracker::Tracker.new(session)

    expect(tracker.instance_variable_get(:@session)).to eq(session)
  end

  it 'throws exception when no session is provided' do
    expect {
      MixpanelTracker::Tracker.new(nil)
    }.to raise_error(ArgumentError)
  end

  it 'accepts events and put them in queue' do
    tracker = MixpanelTracker::Tracker.new(Hash.new)

    expect(tracker.instance_variable_get(:@session)).to eq({})

    tracker.track 'An event'

    expect(tracker.instance_variable_get(:@session)[:mixpanel_events].size).to eq(1)
  end
end
