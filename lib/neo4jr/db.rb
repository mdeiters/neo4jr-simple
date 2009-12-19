module Neo4jr
  class DB
    class << self
      def instance
        @neo ||= begin
          neo = org.neo4j.api.core.EmbeddedNeo.new(Configuration.database_path)
          at_exit do
            neo.shutdown
          end
          neo
        end
      end
  
      def getNodeById(node_id)
        n = nil
        execute do |neo|
          n = neo.getNodeById(node_id)
        end
        return n
      end
      
      def execute
        neo = instance
        transaction = neo.beginTx();
        begin
          yield neo
          transaction.success
        rescue Exception => e
          transaction.failure
          raise e
        ensure
          transaction.finish
        end
      end
      
      def node_count
        instance.getConfig().getNeoModule().getNodeManager().getNumberOfIdsInUse(org.neo4j.api.core.Node.java_class)
      end
      
      def stats
        info = ['== Database Stats ==']
        info << "Path:  #{Configuration.database_path}"
        info << "Nodes: #{node_count}"
        info << '===================='
        info.join("\n")
      end
      
      def to_s
        stats
      end      
    end
  end
end