# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'snipcheat/version'

Gem::Specification.new do |gem|
  gem.name          = "snipcheat"
  gem.version       = Snipcheat::VERSION
  gem.authors       = ["Tadas Tamosauskas"]
  gem.email         = ["tadas@pdfcv.com"]
  gem.description   = %q{Generate a cheatsheet HTML given a directory with Sublime Text snippets}
  gem.summary       = %q{Sublime Text 2 snippet cheat-sheet generator}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency 'nokogiri'
  gem.add_dependency 'thor'
end
