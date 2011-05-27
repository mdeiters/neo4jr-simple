module Neo4jr
  module Direction
    OUTGOING = org.neo4j.graphdb.Direction::OUTGOING
    INCOMING = org.neo4j.graphdb.Direction::INCOMING
    BOTH     = org.neo4j.graphdb.Direction::BOTH
    
    def self.from_string(value)
      case value.upcase
        when 'BOTH' then return BOTH
        when 'OUTGOING' then return OUTGOING
        when 'INCOMING' then return INCOMING
      end
    end
  end
end
