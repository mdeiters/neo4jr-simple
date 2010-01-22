$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))

include Java

module Neo4jr
  require 'jars/shell-1.0-b10.jar'
  require 'jars/neo-1.0-b10.jar'
  require 'jars/jta-1.1.jar'
  require 'jars/graph-algo-0.2-20090815.182816-1.jar'

  java_import java.lang.System
  java_import org.neo4j.api.core.EmbeddedNeo
  java_import org.neo4j.graphalgo.AllSimplePaths
  java_import org.neo4j.graphalgo.shortestpath.Dijkstra
  java_import org.neo4j.graphalgo.shortestpath.CostEvaluator
  java_import org.neo4j.graphalgo.shortestpath.std.IntegerEvaluator
  java_import org.neo4j.graphalgo.shortestpath.std.DoubleAdder
  java_import org.neo4j.graphalgo.shortestpath.std.DoubleComparator
  java_import org.neo4j.api.core.DynamicRelationshipType
end

require 'neo4jr/configuration'
require 'neo4jr/db'
require 'neo4jr/relationship_type'
require 'neo4jr/embedded_neo_extension'
require 'neo4jr/node_extension'
require 'neo4jr/relationship_extension'
require 'neo4jr/property_container_extension'
require 'neo4jr/int_array_iterator_extension'
require 'neo4jr/traverser_extension'
require 'neo4jr/returnable_evaluator'
require 'neo4jr/stop_evaluator'
require 'neo4jr/simple_cost_evaluator'
require 'neo4jr/order'
require 'neo4jr/direction'
require 'neo4jr/path_rater'
require 'neo4jr/cli'