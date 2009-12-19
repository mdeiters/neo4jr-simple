module Neo4jr
  #SEE: http://api.neo4j.org/current/org/neo4j/api/core/StopEvaluator.html
  class StopEvaluator
    DEPTH_ONE = org.neo4j.api.core.StopEvaluator::DEPTH_ONE
    END_OF_GRAPH = org.neo4j.api.core.StopEvaluator::END_OF_GRAPH
    END_OF_NETWORK = org.neo4j.api.core.StopEvaluator::END_OF_NETWORK
  
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

    def self.at(depth)
      self.when do |position|
        position.depth >= depth
      end
    end
  end
  
  Stop = StopEvaluator
end