org.neo4j.kernel.EmbeddedGraphDatabase.java_class.ruby_class.class_eval do 
  
  alias :orginalGetNodeById :getNodeById
  def getNodeById(id)
    orginalGetNodeById(id.to_i)
  end
  
  alias :orginalCreateNode :createNode
  def createNode(hash = nil)
    node = orginalCreateNode
    node.update_properties(hash)
    node
  end
  alias :create_node :createNode

  def find_node_by_identifier(identifier_value)
    Neo4jr::Indexer.find_node_by_identifier(identifier_value)
  end
    
end