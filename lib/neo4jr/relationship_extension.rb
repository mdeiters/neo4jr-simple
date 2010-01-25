org.neo4j.graphdb.Relationship.java_class.ruby_class.class_eval do 
  
  def to_hash
    properties
    extra_values = {:node_id => self.getId, :kind => 'Relationship'}
    extra_values['type'] = self.getType.name
    extra_values['to'] = self.getEndNode.id
    properties.merge(extra_values)
  end

end