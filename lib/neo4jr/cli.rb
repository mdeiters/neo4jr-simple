module Neo4jr
  class CLI
    def self.execute(arguments=[])
        org.neo4j.util.shell.StartClient.main arguments.to_java(:String)
    end
  end
end

