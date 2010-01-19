$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'spec'
require 'spec/autorun'
require 'neo4jr-simple'

Neo4jr::Configuration.database_path = File.join(File.expand_path(File.dirname(__FILE__)), 'test-imdb-database')

Spec::Runner.configure do |config|
  
end