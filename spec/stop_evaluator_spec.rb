require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Neo4jr::StopEvaluator do
  it 'should alias class with class Stop' do
    Neo4jr::Stop::DEPTH_ONE.should == Neo4jr::StopEvaluator::DEPTH_ONE
  end
  
  it 'should create dynamic evaluators on the fly' do
    dynamic_evaluator = Neo4jr::Stop.when do |postion|
      true if postion == :test
    end
    dynamic_evaluator.isStopNode(:test).should == true
  end
  
  it 'should create a dynamic evaluator for a number' do
    evaluator = Neo4jr::Stop.at(2)
    mock_position = Object.new
    mock_position.instance_eval do 
      def depth
        1
      end
    end
    evaluator.isStopNode(mock_position).should be_false
    
    mock_position.instance_eval do 
      def depth
        2
      end
    end    
    evaluator.isStopNode(mock_position).should be_true
  end
end