module Neo4jr
  # SEE: http://api.neo4j.org/current/org/neo4j/api/core/StopEvaluator.html
  class StopEvaluator
    DEPTH_ONE      = org.neo4j.graphdb.StopEvaluator::DEPTH_ONE
    END_OF_GRAPH   = org.neo4j.graphdb.StopEvaluator::END_OF_GRAPH
    END_OF_NETWORK = org.neo4j.graphdb.StopEvaluator::END_OF_NETWORK

    # Creates a new StopEvaluator on the fly that delgates to the passed in block to use with the traverse method. 
    # The block should return either true or false
    # See http://api.neo4j.org/current/org/neo4j/api/core/StopEvaluator.html#isStopNode(org.neo4j.api.core.TraversalPosition)
    #
    # Examples:
    #
    #   Stop.when do |current_position|
    #     current_position.depth > 3 && current_position.previousNode[:active] == false
    #   end
    #
    def self.when(&block)
      instance = new
      instance.instance_variable_set(:@evaluator_block, block)
      instance.instance_eval do
        def isStopNode(position)
          @evaluator_block.call(position)
        end
      end
      instance
    end

    # Creates a new StopEvaluator on the fly that will stop traversing the graph when the depth specified is reached
    #
    # Examples:
    #
    #   Stop.at(4)
    #
    def self.at(depth)
      self.when do |position|
        position.depth >= depth
      end
    end
  end
  
  Stop = StopEvaluator
end