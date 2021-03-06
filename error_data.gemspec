# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'error_data'
  s.version = '0.1.0.0'
  s.summary = 'Representation of an error as a data structure'
  s.description = ' '

  s.authors = ['The Eventide Project']
  s.email = 'opensource@eventide-project.org'
  s.homepage = 'https://github.com/eventide-project/error-data'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.2.3'

  s.add_runtime_dependency 'schema'
  s.add_runtime_dependency 'casing'

  s.add_development_dependency 'serialize'
  s.add_development_dependency 'test_bench'
end
