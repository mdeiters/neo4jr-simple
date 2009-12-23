include Java

module Neo4jr
  require 'jars/neo-1.0-b10.jar'
  require 'jars/shell-1.0-b10.jar'
  require 'jars/jta-1.1.jar'
  require 'jars/graph-algo-0.2-20090815.182816-1.jar'
  
  AllSimplePaths = org.neo4j.graphalgo.AllSimplePaths
end

require 'neo4jr/configuration'
require 'neo4jr/db'
require 'neo4jr/relationship_type'
require 'neo4jr/node_extension'
require 'neo4jr/relationship_extension'
require 'neo4jr/property_container_extension'
require 'neo4jr/traverser_extension'
require 'neo4jr/returnable_evaluator'
require 'neo4jr/stop_evaluator'
require 'neo4jr/order'
require 'neo4jr/direction'
require 'neo4jr/version'
require 'neo4jr/cli'