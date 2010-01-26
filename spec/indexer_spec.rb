require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Neo4jr::Indexer do
  
  it 'is always created when we just access a neo4j database' do
    Neo4jr::DB.instance
    Neo4jr::Indexer.should be_enabled
  end
  
  it 'indexes and finds nodes using the indentifier' do
    random_identifier = Object.new.object_id

    node_created = Neo4jr::DB.execute do |neo| 
      neo.createNode(:identifier => random_identifier)
    end
    
    node_found = Neo4jr::DB.execute do |neo| 
      neo.find_node_by_identifier(random_identifier)
    end
      
    node_found.id.should == node_created.id
  end
  
  it 'only allows one object to be indexed by indentifier' do
    first_node = nil
    last_node = nil
    node_found = Neo4jr::DB.execute do |neo| 
      first_node = neo.createNode(:identifier => 'asdf')
      last_node = neo.createNode(:identifier => 'asdf')
      last_node = neo.createNode(:identifier => 'asdf')
      neo.find_node_by_identifier('asdf')
    end    
    last_node.id.should == node_found.id
  end
  
end
