# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'string_to_text/version'

Gem::Specification.new do |gem|
  gem.name          = "string_to_text"
  gem.version       = StringToText::VERSION
  gem.authors       = ["Quentin Rousseau"]
  gem.email         = ["contact@quent.in"]
  gem.description   = <<-EOD
  Command line app which parses a schema.rb and generate a rails migration to convert all string columns to text columns for postgresql.
EOD
  gem.summary               = %q{Generate rails migration to convert all string columns to text columns for postgresql.}
  gem.homepage              = "http://github.com/kwent/string_to_text"
  gem.bindir                = "bin"
  gem.files                 = Dir["*.{md,txt}", "{lib}/**/*"]
  gem.executables           = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.require_paths         = ["lib"]
  gem.licenses              = ['MIT']
  gem.required_ruby_version = '>= 1.9.3'

  gem.add_runtime_dependency('activesupport', '>= 3.2.1')
  gem.add_runtime_dependency('railties', '>= 3.2.1')
  gem.add_development_dependency('pry', '~> 0.10', '>= 0.10.0')
  gem.add_development_dependency('rspec')
end
