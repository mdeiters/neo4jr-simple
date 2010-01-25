module Neo4jr
  # SEE: http://api.neo4j.org/current/org/neo4j/api/core/ReturnableEvaluator.html
  class ReturnableEvaluator
    ALL                = org.neo4j.graphdb.ReturnableEvaluator.ALL
    ALL_BUT_START_NODE = org.neo4j.graphdb.ReturnableEvaluator.ALL_BUT_START_NODE
    
    # Creates a new ReturnableEvaluator on the fly that delgates to the passed in block to use with the traverse method. 
    # The block should return either true or false
    # See http://api.neo4j.org/current/org/neo4j/api/core/ReturnableEvaluator.html#isReturnableNode(org.neo4j.api.core.TraversalPosition)
    #
    # Examples:
    #
    #   Return.when do |current_position|
    #     current_position.depth > 3 && current_position.previousNode[:active] == false
    #   end
    #
    def self.when(&block)
      instance = new
      instance.instance_variable_set(:@evaluator_block, block)
      instance.instance_eval do
        def isReturnableNode(position)
          @evaluator_block.call(position)
        end
      end
      instance
    end
    
    def self.everything
      self.when do |position|
        true
      end
    end
    
  end
  
  Return = ReturnableEvaluator
end