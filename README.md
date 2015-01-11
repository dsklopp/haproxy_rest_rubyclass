# HaproxyRest

Demonstration Gem meant to be run as a server daemon for querying and controlling HAProxy.

## Design
A single object represents HAProxy config

Another object represents HAProxy service daemon

Another object represents a listening server daemon.

The Listening server daemon only supports two operations, with three results.
 1. Get backend config, returns the HAProxy backend config
 2. Modify listening server, sets the HAProxy backend config and reloads HAProxy
 3. Invalid input, returns error.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'haproxy_rest'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install haproxy_rest

## Usage

```
require 'haproxy_rest'
HaproxyRest.run()
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/haproxy_rest/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
