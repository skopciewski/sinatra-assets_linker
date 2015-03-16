# coding: utf-8

require './lib/assets_linker/version'

Gem::Specification.new do |spec|
  spec.name          = 'sinatra-assets_linker'
  spec.version       = AssetsLinker::VERSION
  spec.authors       = ['Szymon Kopciewski']
  spec.email         = 's.kopciewski@gmail.com'
  spec.summary       = ''
  spec.description   = ''
  spec.homepage      = 'https://github.com/skopciewski/sinatra-assets_linker'
  spec.license       = 'GPL-3.0'

  spec.files         = Dir.glob('{bin,lib}/**/*') + \
                       %w(Gemfile LICENSE README.md CHANGELOG.md)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-given'

end
