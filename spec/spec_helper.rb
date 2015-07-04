require "rspec"
require "rspec/given"
require "rack/test"

require "support/sinatra_app"

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.color = true
end
