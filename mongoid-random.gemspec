# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mongoid/random/version"

Gem::Specification.new do |s|
  s.name        = "mongoid-random"
  s.version     = Mongoid::Random::VERSION
  s.authors     = ["Dave Krupinski"]
  s.email       = ["dave@davekrupinski.com"]
  s.homepage    = "https://github.com/davekrupinski/mongoid-random"
  s.summary     = "Randomization extensions for Mongoid documents"
  s.description = "Add a random key to all documents in a collection for random retrieval"

  s.rubyforge_project = "mongoid-random"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('mongoid', [ '>= 2.0.0' ])

  s.add_development_dependency('bson_ext')
  s.add_development_dependency('minitest', [ '>= 2.7.0' ])
  s.add_development_dependency('mini_shoulda', [ '>= 0.4.0' ])
  s.add_development_dependency('spork', [ '>= 0.9.0.rc' ])
  s.add_development_dependency('spork-testunit', [ '>= 0.0.6' ])
  s.add_development_dependency('guard-minitest', [ '>= 0.4.0' ])
  s.add_development_dependency('guard-spork', [ '>= 0.3.1' ])
  s.add_development_dependency('turn', [ '>= 0.8.3' ])

end
