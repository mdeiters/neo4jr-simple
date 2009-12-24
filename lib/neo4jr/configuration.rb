module Neo4jr
  class Configuration
    class << self
      def database_path
        @database_path ||= (System.getProperty('neo4jr.database') || Dir.mktmpdir)
      end
    
      def database_path=(value)
        @database_path = value
      end
    end
  end
end