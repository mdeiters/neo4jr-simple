require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Neo4j Working Examples" do
  it "queries all nodes" do
    Neo4jr::DB.execute do |neo|
      hanks = neo.all_nodes.select{|people| people if people.get_property('name').match(/Hanks/) rescue nil }
      hanks.should have(2).nodes
      hanks.first.get_property('name').should == 'Hanks, Tom'
      hanks.last.get_property('name').should == 'Hanks, Jay (I)'
    end
  end
  
  it 'cruds nodes' do
    node_id = nil
    #CREATES
    Neo4jr::DB.execute do |neo|
      node = neo.createNode
      node[:name] = 'Deiters, Matt'
      node_id = node.getId
    end

    #UPDATES
    node = Neo4jr::DB.getNodeById(node_id)
    node[:name].should == 'Deiters, Matt'

    #DELETES
    Neo4jr::DB.execute do |neo|
      node = neo.getNodeById(node_id)
      node.delete
    end
  end
  
  it 'can traverse a node using the raw API' do
    Neo4jr::DB.execute do |neo|
      # Node[1102]: Hoffman, Philip Seymour
      # Node[1104]: Hoffman, Dustin    
      philip_seymour_hoffman = neo.getNodeById(1102)

      order        = Neo4jr::Order::BREADTH_FIRST
      stop_when    = Neo4jr::StopEvaluator::END_OF_GRAPH
      return_when  = Neo4jr::ReturnableEvaluator::ALL
      relationship = Neo4jr::RelationshipType.outgoing(:acted_in)
      
      traverser = philip_seymour_hoffman.traverse(order, stop_when, return_when, relationship)
      # traverser.each do |person_or_movie|
      #   puts person_or_movie.get_property('title') rescue person_or_movie.get_property('name')
      # end
      traverser.size.should == 15
    end
  end
end