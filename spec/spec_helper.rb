$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'neo4jr-simple'
require 'spec'
require 'spec/autorun'

Neo4jr::Configuration.database_path = File.join(File.expand_path(File.dirname(__FILE__)), 'test-imdb-database')

Spec::Runner.configure do |config|
  
end