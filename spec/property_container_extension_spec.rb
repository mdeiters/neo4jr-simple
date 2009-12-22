require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'property container extension' do

  it "adds [] read accessor method for properties" do
    tom_hanks = Neo4jr::DB.instance.getNodeById(893)
    tom_hanks[:name].should == 'Hanks, Tom'
  end
  
  it 'adds [] setter accessor method for properties' do
    Neo4jr::DB.execute do |neo|
      tom_hanks = neo.getNodeById(893)
      tom_hanks[:testing] = '123'
      tom_hanks[:testing].should == '123'
    end
  end
end
