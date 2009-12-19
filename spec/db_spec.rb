require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Neo4jr::DB do
  it 'should fail the transaction if an error happens and then propgate the original exception' do
    lambda{
      Neo4jr::DB.execute do |neo|
        raise SystemCallError, 'testing'
      end
    }.should raise_error(SystemCallError)
  end
end