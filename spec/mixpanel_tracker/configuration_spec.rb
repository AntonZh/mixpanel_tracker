require 'spec_helper'

describe MixpanelTracker::Configuration do
  let(:conf) { MixpanelTracker::Configuration.new }

  it 'considered disabled only if enabled set to false' do
    conf.enabled = false

    expect(conf.disabled?).to be_true
  end

  it 'considered enabled only if enabled is not false' do
    [nil, true].each do |v|
      conf.enabled = v
    end

    expect(conf.disabled?).to be_false
  end
end
