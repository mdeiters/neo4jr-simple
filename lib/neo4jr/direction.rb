module Neo4jr
  module Direction
    OUTGOING = org.neo4j.graphdb.Direction::OUTGOING
    INCOMING = org.neo4j.graphdb.Direction::INCOMING
    BOTH     = org.neo4j.graphdb.Direction::BOTH
    
    def self.from_string(value)
      case value.upcase
        when 'BOTH': return BOTH
        when 'OUTGOING': return OUTGOING
        when 'INCOMING': return INCOMING
      end
    end
  end
end