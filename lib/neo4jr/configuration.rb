module Neo4jr
  class Configuration
    class << self
      def database_path
        @database_path ||= 'tmp-neo4j-db'
      end
    
      def database_path=(value)
        @database_path = value
      end
    end
  end
end