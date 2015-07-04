# coding: utf-8

begin
  require "./lib/sinatra-assets_linker/version"
rescue LoadError
  module SinatraAssetsLinker; VERSION = "0"; end
end

Gem::Specification.new do |spec|
  spec.name          = "sinatra-assets_linker"
  spec.version       = SinatraAssetsLinker::VERSION
  spec.authors       = ["Szymon Kopciewski"]
  spec.email         = "s.kopciewski@gmail.com"
  spec.summary       = "The Sinatra helper for the assets links."
  spec.description   = "Provides the methods for generating the assets urls."
  spec.homepage      = "https://github.com/skopciewski/sinatra-assets_linker"
  spec.license       = "GPL-3.0"

  spec.require_paths = ["lib"]
  spec.files = Dir.glob("{bin,lib}/**/*") + \
    %w(Gemfile LICENSE README.md CHANGELOG.md)

  spec.add_runtime_dependency "sinatra", ">=1.4"

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-given"
  spec.add_development_dependency "rack-test"
end
