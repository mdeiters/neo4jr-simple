# Extends the Node class with a hash style accessor methods to the node's properties
org.neo4j.api.core.PropertyContainer.java_class.ruby_class.class_eval do 
  
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
    set_property(arg.to_s, value)
  end
  
  def properties
    properties = {}
    propertyKeys.each do |property|
      properties[property] = self[property]
    end
    properties
  end
  
end
