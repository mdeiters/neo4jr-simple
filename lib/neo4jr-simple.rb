include Java

module Neo4j
  require 'jars/neo-1.0-b9.jar'
  require 'jars/shell-1.0-b9.jar'
  require 'jars/jta-1_1.jar'
end

require 'neo4jr/configuration'
require 'neo4jr/db'
require 'neo4jr/relationship_type'
require 'neo4jr/node_extension'
require 'neo4jr/traverser_extension'
require 'neo4jr/returnable_evaluator'
require 'neo4jr/stop_evaluator'
require 'neo4jr/order'
require 'neo4jr/direction'
require 'neo4jr/version'