require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Neo4jr::Direction do
  it 'can convert from string to type' do
    Neo4jr::Direction.from_string('both').should == Neo4jr::Direction::BOTH
  end
end
