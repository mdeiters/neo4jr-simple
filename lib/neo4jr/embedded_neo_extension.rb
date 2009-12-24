org.neo4j.api.core.EmbeddedNeo.java_class.ruby_class.class_eval do 
  
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
  
  
end