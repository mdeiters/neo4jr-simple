org.neo4j.api.core.Node.java_class.ruby_class.class_eval do
  
  def id
    getId
  end
  
  def [](arg)
    get_property(arg.to_s)
  end
  def []=(arg, value)
    set_property(arg.to_s, value)
  end
end
