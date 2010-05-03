$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))

include Java

module Neo4jr
  require 'jars/neo4j-kernel-1.0.jar'
  require 'jars/lucene-core-2.9.1.jar'
  require 'jars/neo4j-index-1.0.jar'
  require 'jars/geronimo-jta_1.1_spec-1.1.1.jar'
  require 'jars/jline-0.9.94.jar'
  require 'jars/neo4j-commons-1.0.jar'
  require 'jars/neo4j-remote-graphdb-0.6.jar'
  require 'jars/neo4j-graph-algo-0.5-20100430.103813-56.jar'

  java_import java.lang.System
  java_import org.neo4j.kernel.EmbeddedGraphDatabase
  java_import org.neo4j.graphdb.DynamicRelationshipType
  java_import org.neo4j.graphdb.Traverser
  java_import org.neo4j.index.lucene.LuceneIndexService
  java_import org.neo4j.graphalgo.AllSimplePaths
  java_import org.neo4j.graphalgo.shortestpath.Dijkstra
  java_import org.neo4j.graphalgo.shortestpath.CostEvaluator
  java_import org.neo4j.graphalgo.shortestpath.std.IntegerEvaluator
  java_import org.neo4j.graphalgo.shortestpath.std.DoubleAdder
  java_import org.neo4j.graphalgo.shortestpath.std.DoubleComparator
end

require 'neo4jr/configuration'
require 'neo4jr/db'
require 'neo4jr/indexer'
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
require 'neo4jr/max_cost_evaluator'
require 'neo4jr/order'
require 'neo4jr/direction'
require 'neo4jr/path_rater'
require 'neo4jr/cli'