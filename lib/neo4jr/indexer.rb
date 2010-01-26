module Neo4jr
  class Indexer
    RESERVED_IDENTIFIER_KEY = 'identifier'
    
    class << self
      def use(service)
        @indexer = LuceneIndexService.new(service)
      end
      
      def enabled?
        !@indexer.nil?
      end
      
      def attempt_index(node, property_name, value)
        @indexer.index(node, RESERVED_IDENTIFIER_KEY, value.to_s) if property_name == RESERVED_IDENTIFIER_KEY
      end
      
      def find_node_by_identifier(identifier_value)
        hits    = @indexer.getNodes(RESERVED_IDENTIFIER_KEY, identifier_value)
        nodes   = hits.iterator
        results = []
        results << nodes.next while nodes.hasNext
        if results.size > 1
          results.sort!{|a, b| a.getId <=> b.getId}
          results.each_with_index{|node, index| @indexer.removeIndex(node, RESERVED_IDENTIFIER_KEY, identifier_value) if index < results.size}
        end
        results.last
      end
    end    
  end
end

# begin
#   
#   node = nodes.next
# end while(nodes.hasNext)
# return node
