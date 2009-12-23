module Neo4jr
  module Direction
    OUTGOING = org.neo4j.api.core.Direction::OUTGOING
    INCOMING = org.neo4j.api.core.Direction::INCOMING
    BOTH     = org.neo4j.api.core.Direction::BOTH
    
    def self.from_string(value)
      case value.upcase
        when 'BOTH': return BOTH
        when 'OUTGOING': return OUTGOING
        when 'INCOMING': return INCOMING
      end
    end
  end
end