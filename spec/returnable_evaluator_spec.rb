require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Neo4jr::ReturnableEvaluator do
  it 'should alias class with class Return' do
    Neo4jr::Return::ALL.should == Neo4jr::ReturnableEvaluator::ALL
    
  end
  
  it 'should create dynamic evaluators on the fly' do
    dynamic_evaluator = Neo4jr::Return.when do |postion|
      true if postion == :test
    end
    dynamic_evaluator.isReturnableNode(:test).should == true
  end
end