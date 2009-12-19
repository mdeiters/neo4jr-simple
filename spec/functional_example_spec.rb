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
  
  describe 'cruding a node' do
    let(:node_id) do
      node_id = nil
      Neo4jr::DB.execute do |neo|
        node = neo.createNode
        node[:name] = 'Deiters, Matt'
        node_id = node.getId
      end
      node_id
    end
    
    after :each do
      Neo4jr::DB.execute do |neo|
        node = neo.getNodeById(node_id)
        node.delete
      end
    end
    
    it 'can later read the node' do
      node = Neo4jr::DB.getNodeById(node_id)
      node[:name].should == 'Deiters, Matt'
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



#NOT FULLY WORKING - TRYING TO PULL SOURCE FROM http://wiki.neo4j.org/content/IMDB_Example
require File.expand_path(File.dirname(__FILE__) + '/example_setup')

neo = Neo4j::DB.instance

class StopAt
  def initialize(value)
    @value = value
  end
  
  def isStopNode(current_position)
    current_position.depth >= @value
  end
end

class ShortestPathEval

  attr_reader :my_nodes, :other_nodes, :match
  
  def initialize( my_nodes = {}, other_nodes = {})
    @my_nodes = my_nodes
    @other_nodes = other_nodes
    @match = []
  end
  
  def isReturnableNode(current_position)
    new_list = []

    previous_node = current_position.previousNode
    currentNode = current_position.currentNode
    
    if previous_node
      previous_list = my_nodes[previous_node] ||= []
      new_list = previous_list.dup
      new_list << previous_node
    end
    
    if other_nodes[currentNode].nil?
      my_nodes[currentNode] = new_list
    else
      other_list = other_nodes[currentNode]
      match = new_list
      match << currentNode
      other_list.reverse.each{|item| match << item}
    end
    
    return true
  end
end

# transaction = neo.beginTx();
# begin
#   philip_seymour_hoffman =  neo.getNodeById(1102)
#   dustin_hoffman =  neo.getNodeById(893)#< tom hanks #neo.getNodeById(1104)
#   
#   traversedNodes1 = {}
#   traversedNodes2 = {}
#   stop_eval = StopAt.new(20)
#   short_eval_1 = ShortestPathEval.new( traversedNodes1, traversedNodes2 );
#   short_eval_2 = ShortestPathEval.new( traversedNodes2, traversedNodes1 );
#   # 
#   # 
#   trav1 = philip_seymour_hoffman.traverse(
#     org.neo4j.api.core.Traverser::Order::BREADTH_FIRST,
#     stop_eval,
#     short_eval_1,
#     [
#       RelationshipType.new('acted_in'),
#       org.neo4j.api.core.Direction::BOTH
#     ].to_java(:object)
#   )
#   
#   trav2 = dustin_hoffman.traverse(
#     org.neo4j.api.core.Traverser::Order::BREADTH_FIRST,
#     stop_eval,
#     short_eval_2,
#     [
#       RelationshipType.new('acted_in'),
#       org.neo4j.api.core.Direction::BOTH
#     ].to_java(:object)
#   )
#   
#   itr1 = trav1.iterator;
#   itr2 = trav2.iterator;
#   
#   while ( itr1.hasNext || itr2.hasNext )
#     itr1.next if itr1.hasNext
#     puts short_eval_1.match.size if !short_eval_1.match.empty?
#   
#     itr2.next if itr2.hasNext
#     puts short_eval_2.match.reverse.size if !short_eval_2.match.empty?
# 
#   end
#   raise "NO PATH"
#   
#   # def pretty(node, trav1)
#   #   puts trav1.currentPosition.depth
#   #   node.get_property('name') rescue node.get_property('title')
#   # end
#   # 
#   # trav1 = philip_seymour_hoffman.traverse(
#   #   org.neo4j.api.core.Traverser::Order::BREADTH_FIRST,
#   #   stop_eval,
#   #   org.neo4j.api.core.ReturnableEvaluator.ALL_BUT_START_NODE,
#   #   [
#   #     RelationshipType.new('acted_in'),
#   #     org.neo4j.api.core.Direction::BOTH
#   #   ].to_java(:object)
#   # )
#   # 
#   # require 'benchmark'
#   # 
#   # r = Benchmark.measure do
#   #   trav1.each do |i|
#   #     pretty(i, trav1)
#   #   end
#   # end
#   # puts r
# ensure
#   transaction.finish
# end
# 
