require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Neo4jr::EmbeddedNeo do

  it 'should retreive nodes by string' do
    lambda{
      Neo4jr::DB.getNodeById("0")
    }.should_not raise_error    
  end

  it 'accepts a hash when creating a node' do
    node_created = Neo4jr::DB.execute do |embedded_neo| 
      embedded_neo.create_node(:a => 'b')
    end
    node_created[:a].should == 'b'
  end
  
end