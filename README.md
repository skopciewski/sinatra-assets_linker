# Sinatra AssetsLinker Helper

[![Gem Version](https://badge.fury.io/rb/sinatra-assets_linker.svg)](http://badge.fury.io/rb/sinatra-assets_linker)
[![Code Climate](https://codeclimate.com/github/skopciewski/sinatra-assets_linker/badges/gpa.svg)](https://codeclimate.com/github/skopciewski/sinatra-assets_linker)
[![Dependency Status](https://gemnasium.com/badges/github.com/skopciewski/sinatra-assets_linker.svg)](https://gemnasium.com/github.com/skopciewski/sinatra-assets_linker)


Provided methods:
* `css_uri(file_name, add_script_name = true)`
* `js_uri(file_name, add_script_name = true)`
* `img_uri(file_name, add_script_name = true)`

They extend the [`uri`][uri] method from the Sinatra.
Always returns relative paths, unless you set `:project_cdn_url`.

## Installation

Add this line to your application's Gemfile:

    gem 'sinatra-assets_linker'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sinatra-assets_linker

## Configuration

Through `SinatraAssetsLinker::Config` class:

```ruby
config = SinatraAssetsLinker::Config.new(
  "project_css_dir" => "css_dir"                    # default: "stylesheets"
  "project_javascripts_dir" => "js_dir"             # default: "javascripts"
  "project_js_compressed_dir" => "cjs_dir"          # default: "js"
  "project_images_dir" => "img_dir"                 # default: "images"
  "project_assets_verbose" => true                  # default: false
  "project_cdn_url" => "http://cdn.net"             # default: nil
)
```

## Usage

Above methods look for configuration under: `settings.assets_linker_config`, so:

```ruby
require 'sinatra/base'
require 'sinatra/assets_linker'

class MyApp < Sinatra::Base
  helpers Sinatra::AssetsLinker

  configure do
    set :assets_linker_config, SinatraAssetsLinker::Config.new(ENV.to_h)
  end
end
```

and when you call:

```ruby
css_uri('file.css')       # -> /css_dir/file.css
js_uri('file.js')         # -> /js_dir/file.js
img_uri('file.jpg')       # -> /img_dir/file.jpg
```

if you set `"project_cdn_url"` before, you get:

```ruby
css_uri('file.css')       # -> http://cdn.net/css_dir/file.css
js_uri('file.js')         # -> http://cdn.net/js_dir/file.js
img_uri('file.jpg')       # -> http://cdn.net/img_dir/file.jpg
```

## Assets verbose

If you set `"project_assets_verbose"` to `true`, then the `js_uri` method will
use `project_javascripts_dir` instead of `project_js_compressed_dir`

## Versioning

See [semver.org][semver]


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[uri]: https://github.com/sinatra/sinatra/blob/master/lib/sinatra/base.rb#L265
[semver]: http://semver.org/
