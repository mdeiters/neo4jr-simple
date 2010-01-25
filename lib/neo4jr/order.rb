module Neo4jr
  # SEE: http://api.neo4j.org/current/org/neo4j/api/core/Traverser.Order.html
  class Order
    BREADTH_FIRST = org.neo4j.graphdb.Traverser::Order::BREADTH_FIRST
    DEPTH_FIRST   = org.neo4j.graphdb.Traverser::Order::DEPTH_FIRST
  end
end
