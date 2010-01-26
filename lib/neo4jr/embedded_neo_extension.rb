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
  
  def find_node(value)
    find_node_by_identifier(value) || begin
      node_id = value.to_f 
      getNodeById(node_id) if node_id > 0
    end
  end
  
end