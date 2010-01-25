require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Neo4jr::RelationshipType do
  
  it 'converts a string into a RelationshipType' do
    Neo4jr::RelationshipType.instance('worked_in').should be_is_a(Neo4jr::RelationshipType)
  end

  it 'converts multiople types into an typed array of RelationshipType' do
    relationship_types = Neo4jr::RelationshipType.instances('worked_in', 'acted_in')
    relationship_types.size.should == 2
    relationship_types[0].should be_is_a(Neo4jr::RelationshipType)
    relationship_types[1].should be_is_a(Neo4jr::RelationshipType)
  end
  
  it 'can covert one relationship type to a java array so it can be used with the neo4j API' do
    relationship_type = Neo4jr::RelationshipType.instance('worked_in')
    relationship_type.to_a.class.java_class.to_s.should == '[Lorg.neo4j.graphdb.RelationshipType;'
  end
  
end