# Extends the Node class with a hash style accessor methods to the node's properties
org.neo4j.api.core.Node.java_class.ruby_class.class_eval do
  
  def id
    getId
  end
  
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
  
end
