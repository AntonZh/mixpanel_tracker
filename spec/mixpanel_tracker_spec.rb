require 'spec_helper'

describe MixpanelTracker do
  it 'can be configured' do
    MixpanelTracker.configure do |c|
      c.access_token = 'dummy'
      c.enabled = true
      c.register_utm_params = true
    end
  end

  it 'adds mixpanel method to ActionController::Base' do
    expect(ActionController::Base.new).to respond_to(:mixpanel)
  end

  it 'adds include_mixpanel method to ActionView::Base' do
    expect(ActionView::Base.new).to respond_to(:include_mixpanel)
  end
end
