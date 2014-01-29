mixpanel_tracker
===============
[![Gem Version](https://badge.fury.io/rb/mixpanel_tracker.png)](http://badge.fury.io/rb/mixpanel_tracker)
[![Code Climate](https://codeclimate.com/github/AntonZh/mixpanel_tracker.png)](https://codeclimate.com/github/AntonZh/mixpanel_tracker)
[![Build Status](https://travis-ci.org/AntonZh/mixpanel_tracker.png?branch=master)](https://travis-ci.org/AntonZh/mixpanel_tracker)

Provides ability to track [Mixpanel](https://mixpanel.com) events in Rails.
Events can be tracked from controllers - and no funnel will break.

Installation
------------

Add to your Gemfile
```ruby
gem 'mixpanel_tracker'
```

And bundle it
```bash
$ bundle
```

Then, run the generator
```bash
$ rails generate mixpanel_tracker YOUR_ACCESS_TOKEN
```
This will generate initializer ```mixpanel_tracker.rb```.

If you omit ```YOUR_ACCESS_TOKEN```, initializer will try to fetch access token from environment variable ```ENV['MIXPANEL_ACCESS_TOKEN']```.

Place this in your layout before the closing ```</head>``` tag:
```erb
<%= include_mixpanel %>
```

Usage
-----
Track events in needed places in your controllers:
```ruby
# landing_controller.rb
def index
  mixpanel.track 'User arrived'
end
```
You can supply additional data to events:
```ruby
# orders_controller.rb
def create
  if @order.save
    mixpanel.track 'Order created', items_count: @order.items.count
  end
end
```

Additional notes
----------------
By default, mixpanel_tracker will fetch utm params and register them in events
```ruby
# mixpanel_tracker.rb
config.register_utm_params = true
```

You may want to not track events in your development or test environment
```ruby
# mixpanel_tracker.rb
if Rails.env.test? or Rails.env.development?
  config.enabled = false
end
```


