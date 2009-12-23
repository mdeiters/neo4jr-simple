org.neo4j.api.core.Node.java_class.ruby_class.class_eval do 
  
  def id
    getId
  end

  def to_hash
    extra_values = {:node_id => self.getId, :kind => 'Node'}
    properties.merge extra_values
  end

end