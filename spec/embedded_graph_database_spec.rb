require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe org.neo4j.kernel.EmbeddedGraphDatabase do
  
  it 'first finds nodes by the value if it has been indexed' do
    node_expected = nil
    identifier = Neo4jr::DB.execute do |neo|
      node_1 = neo.create_node()
      node_expected = neo.create_node('identifier' => node_1.getId)
      node_1.getId
    end    
    
    Neo4jr::DB.execute do |neo|
      found_node = neo.find_node(identifier)
      node_expected.getId.should == found_node.getId
    end
  end

  it 'finds nodes by node id when nothing with the identifier' do
    node_expected = nil
    identifier = Neo4jr::DB.execute do |neo|
      node_expected = neo.create_node()
      node_expected.getId
    end    
    
    Neo4jr::DB.execute do |neo|
      found_node = neo.find_node(identifier)
      node_expected.getId.should == found_node.getId
    end
  end
  
  it 'should not attempt to getnodes by id if identifier is not a number' do
    Neo4jr::DB.execute do |neo|
      neo.find_node('some_string').should be_nil
    end
  end
  
end