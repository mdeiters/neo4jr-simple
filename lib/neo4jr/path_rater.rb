module Neo4jr
  module PathRater
    def get_cost path, start_cost, cost_evaluator, cost_accumulator
      cost = start_cost
      previous = nil
      path.each do |r|
        cost = cost_accumulator.addCosts(cost, cost_evaluator.getCost(r, r.getEndNode == previous)) if r.kind_of? org.neo4j.api.core.Relationship
        previous = r
      end
      cost
    end
  end
end