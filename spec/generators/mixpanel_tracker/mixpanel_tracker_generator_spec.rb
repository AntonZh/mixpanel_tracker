require 'spec_helper'

describe :mixpanel_tracker do
  context 'without arguments' do
    it 'generates initializer with call to ENV variable' do
      subject.should generate('config/initializers/mixpanel_tracker.rb') { |content|
        expect(content).to include('config.access_token = ENV[\'MIXPANEL_ACCESS_TOKEN\']')
      }
    end
  end

  with_args test_token do
    it 'generates initializer with access token' do
      subject.should generate('config/initializers/mixpanel_tracker.rb') { |content|
        expect(content).to include("config.access_token = '#{test_token}'")
      }
    end
  end
end
