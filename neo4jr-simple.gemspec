# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{neo4jr-simple}
  s.version = ""

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matthew Deiters"]
  s.date = %q{2009-12-18}
  s.description = %q{Nothing more then Neo4j and Ruby goodness}
  s.email = %q{matthew_deiters@mckinsey.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "lib/jars/jta-1_1.jar",
     "lib/jars/neo-1.0-b9.jar",
     "lib/jars/shell-1.0-b9.jar",
     "lib/neo4jr-simple.rb",
     "lib/neo4jr/configuration.rb",
     "lib/neo4jr/db.rb",
     "lib/neo4jr/direction.rb",
     "lib/neo4jr/node_extension.rb",
     "lib/neo4jr/order.rb",
     "lib/neo4jr/relationship_type.rb",
     "lib/neo4jr/returnable_evaluator.rb",
     "lib/neo4jr/stop_evaluator.rb",
     "lib/neo4jr/traverser_extension.rb",
     "lib/neo4jr/version.rb",
     "neo4jr-simple.gemspec",
     "spec/db_spec.rb",
     "spec/functional_example_spec.rb",
     "spec/node_extension_spec.rb",
     "spec/returnable_evaluator_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/stop_evaluator_spec.rb",
     "spec/test-imdb-database/active_tx_log",
     "spec/test-imdb-database/neostore",
     "spec/test-imdb-database/neostore.id",
     "spec/test-imdb-database/neostore.nodestore.db",
     "spec/test-imdb-database/neostore.nodestore.db.id",
     "spec/test-imdb-database/neostore.propertystore.db",
     "spec/test-imdb-database/neostore.propertystore.db.arrays",
     "spec/test-imdb-database/neostore.propertystore.db.arrays.id",
     "spec/test-imdb-database/neostore.propertystore.db.id",
     "spec/test-imdb-database/neostore.propertystore.db.index",
     "spec/test-imdb-database/neostore.propertystore.db.index.id",
     "spec/test-imdb-database/neostore.propertystore.db.index.keys",
     "spec/test-imdb-database/neostore.propertystore.db.index.keys.id",
     "spec/test-imdb-database/neostore.propertystore.db.strings",
     "spec/test-imdb-database/neostore.propertystore.db.strings.id",
     "spec/test-imdb-database/neostore.relationshipstore.db",
     "spec/test-imdb-database/neostore.relationshipstore.db.id",
     "spec/test-imdb-database/neostore.relationshiptypestore.db",
     "spec/test-imdb-database/neostore.relationshiptypestore.db.id",
     "spec/test-imdb-database/neostore.relationshiptypestore.db.names",
     "spec/test-imdb-database/neostore.relationshiptypestore.db.names.id",
     "spec/test-imdb-database/nioneo_logical.log.active",
     "spec/test-imdb-database/tm_tx_log.1"
  ]
  s.homepage = %q{http://github.com/mdeiters/neo4jr-simple}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A simple, ready to go JRuby wrapper for the Neo4j graph database engine.}
  s.test_files = [
    "spec/db_spec.rb",
     "spec/functional_example_spec.rb",
     "spec/node_extension_spec.rb",
     "spec/returnable_evaluator_spec.rb",
     "spec/spec_helper.rb",
     "spec/stop_evaluator_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
  end
end

