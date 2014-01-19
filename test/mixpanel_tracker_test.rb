require 'test_helper'

class MixpanelTrackerTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, MixpanelTracker
  end

  test "truth2" do
    c = ApplicationController.new
    assert_equal c.mixpanel.track("Lol", {}), true
  end
end
