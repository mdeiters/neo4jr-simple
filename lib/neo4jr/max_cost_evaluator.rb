module Neo4jr
  class MaxCostEvaluator
    include org.neo4j.graphalgo.shortestpath.MaxCostEvaluator

    def initialize &block
      @evaluator_block = block
    end

    def maxCostExceeded currentCost
      @evaluator_block.call currentCost
    end
  end
end