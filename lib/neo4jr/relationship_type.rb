module Neo4jr
  class RelationshipType
    include org.neo4j.graphdb.RelationshipType

    @@names = {}

    class << self
      def instance(name)
        return @@names[name] if @@names.include?(name)
        @@names[name] = RelationshipType.new(name)
      end
      
      def instances(*names)
        names.map{|name| instance(name)}.to_java(org.neo4j.graphdb.RelationshipType)
      end

      def outgoing(type)
        covert_to_relationship_type(Neo4jr::Direction::OUTGOING, type)
      end
      
      def incoming(type)
        covert_to_relationship_type(Neo4jr::Direction::INCOMING, type)
      end
      
      def both(type)
        covert_to_relationship_type(Neo4jr::Direction::BOTH, type)
      end
      
      private
      def covert_to_relationship_type(direction, type)
        [ Neo4jr::RelationshipType.new(type.to_s),
          direction
        ].to_java(:object)
      end
    end

    def to_s
      self.class.to_s + " name='#{@name}'"
    end
    
    def to_a
      [self].to_java(org.neo4j.graphdb.RelationshipType)
    end

    def name
      @name
    end

    private
    def initialize(name)
      @name = name.to_s
      raise ArgumentError.new("Expect type of relationship to be a name of at least one character") if @name.empty?
    end
  end
end