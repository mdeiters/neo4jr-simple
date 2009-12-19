module Neo4jr
  # SEE: http://api.neo4j.org/current/org/neo4j/api/core/ReturnableEvaluator.html
  class ReturnableEvaluator
    ALL                = org.neo4j.api.core.ReturnableEvaluator.ALL
    ALL_BUT_START_NODE = org.neo4j.api.core.ReturnableEvaluator.ALL_BUT_START_NODE
    
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
  end
  
  Return = ReturnableEvaluator
end