require "test_helper"

module ShortestPathMocks
  class Edge
    attr_accessor :head,:tail,:weight
    def initialize(edge_string)
      edge_string.gsub!(/[\[\]]/,"")
      tail,head,weight = edge_string.split(",")
      @head = head
      @tail = tail
      @weight = weight.to_i
    end
  end
end

describe ShortestPath do
  let(:graph) {Graph.new}
  let(:degenerate_graph) {
    %w{[A,B,3] [A,C,5] [B,C,1]
       [B,D,2] [C,D,50]}.each do |edge_string|
      graph.add_edge ShortestPathMocks::Edge.new(edge_string)
    end
    graph
  }

  it "calculates the shortest path for a degenerate graph" do
    spf = ShortestPath.new degenerate_graph
    spf.calculate("A")
    spf.cost("C").must_be :==,4
    spf.path("C").must_be :==,["A","B","C"]
  end



end