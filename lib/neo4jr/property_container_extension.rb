# Extends the Node class with a hash style accessor methods to the node's properties
org.neo4j.graphdb.PropertyContainer.java_class.ruby_class.class_eval do 
  
  # Example:
  #    node[:name] #=> 'Matt'
  #
  def [](arg)
    get_property(arg.to_s)
  end
  
  # Example:
  #    node[:name] = 'Matt'
  #
  def []=(arg, value)
    Neo4jr::Indexer.attempt_index(self, arg.to_s, value)
    set_property(arg.to_s, value)
  end
    
  def properties
    properties = {}
    propertyKeys.each do |property|
      properties[property] = self[property]
    end
    properties
  end
  
  def update_properties(hash)
    hash.each_pair do |key, value|
      self[key] = convert(value) unless value.nil?
    end unless hash.nil?
  end
  
  private
  def convert(value)
    return value.to_s if value.is_a? Symbol
    value
  end
  
end
