module MixpanelTracker
  class Event
    attr_reader :name, :args

    def initialize(name, args = {})
      @name, @args = name, args
    end
  end
end
