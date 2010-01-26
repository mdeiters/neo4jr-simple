require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'IntArrayIterartor' do
  
  it 'can convert relationships into a hash' do
    Neo4jr::DB.execute do |neo| 
      philip_seymour_hoffman = neo.getNodeById(1102)
      relationships = philip_seymour_hoffman.getRelationships
      lambda{relationships.hashify_objects}.should_not raise_error
    end    
  end

end