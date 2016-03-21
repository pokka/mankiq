# Mankiq

Add manual workers to sidekiq

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mankiq'
```

And then execute:

    $ bundle

## Usage

Configuration

rails

```
Mankiq.config.workers_dir = Rails.root.join("app/workers/manual_workers/*.rb").to_s
```

include module

```
class YourManualWorker
  include Sidekiq::Worker
  include Mankiq::Worker

  def perform
    ...
  end
end
```

Then you can reach a `Manual` tab in sidekiq web interface

Original author: wkang

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

