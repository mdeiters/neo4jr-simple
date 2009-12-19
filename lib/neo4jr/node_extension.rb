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

# def relationships_info
#   self::RELATIONSHIPS_INFO
# end
# 
# # :api: private
# def properties_info
#   self::PROPERTIES_INFO
# end

# def _create_relationship(type, to) # :nodoc:
#   java_type = Relationships::RelationshipType.instance(type)
#   java_relationship = internal_node.createRelationshipTo(to.internal_node, java_type)
# 
#   relationship =
#           if (self.class.relationships_info[type.to_sym].nil?)
#             Relationships::Relationship.new(java_relationship)
#           else
#             self.class.relationships_info[type.to_sym][:relationship].new(java_relationship)
#           end
#   Neo4j.event_handler.relationship_created(relationship)
#   self.class.indexer.on_relationship_created(self, type)
#   relationship
# end
# 
# 
# # :api: private
# def classname # :nodoc:
#   get_property('classname')
# end
# 
# # :api: private
# def classname=(value) # :nodoc:
#   set_property('classname', value)
# end

