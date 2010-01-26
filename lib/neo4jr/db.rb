module Neo4jr
  class DB
    
    class << self
      def instance
        @neo ||= begin
          neo = EmbeddedGraphDatabase.new(Configuration.database_path)
          at_exit do
            neo.shutdown
          end
          Neo4jr::Indexer.use neo
          neo
        end
      end
  
      def getNodeById(node_id)
        execute do |neo|
          neo.getNodeById(node_id)
        end
      end
      
      def execute
        neo = instance
        result = nil
        transaction = neo.beginTx();
        begin
          result = yield neo
          transaction.success
        rescue Exception => e
          transaction.failure
          raise e
        ensure
          transaction.finish
        end
        result
      end
      
      def node_count
        instance.getConfig().getNeoModule().getNodeManager().getNumberOfIdsInUse(org.neo4j.graphdb.Node.java_class)
      end
      
      def stats
        {
          :path => Configuration.database_path,
          :nodes => node_count
        }
      end
      
      def to_s
        stats.inspect
      end      
    end
  end
end