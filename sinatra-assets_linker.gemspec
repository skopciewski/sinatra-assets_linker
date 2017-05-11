# frozen_string_literal: true

begin
  require "./lib/sinatra-assets_linker/version"
rescue LoadError
  module SinatraAssetsLinker; VERSION = "0"; end
end

Gem::Specification.new do |spec|
  spec.name          = "sinatra-assets_linker"
  spec.version       = SinatraAssetsLinker::VERSION
  spec.authors       = ["Szymon Kopciewski"]
  spec.email         = ["s.kopciewski@gmail.com"]
  spec.summary       = "The Sinatra helper for the assets links."
  spec.description   = "Provides methods for generating assets urls."
  spec.homepage      = "https://github.com/skopciewski/sinatra-assets_linker"
  spec.license       = "GPL-3.0"

  spec.require_paths = ["lib"]
  spec.files         = Dir.glob("{bin,lib}/**/*") + \
                       %w[Gemfile LICENSE README.md CHANGELOG.md]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }

  spec.add_runtime_dependency "sinatra", "~>2"
  spec.add_runtime_dependency "piko_model", "~>1"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "codeclimate-test-reporter"
end
