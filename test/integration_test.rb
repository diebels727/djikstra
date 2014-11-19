require "test_helper"

module IntegrationMocks
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

describe "Integration" do
  let(:degenerate_graph) {
    graph = Graph.new
    %w{[A,B,3] [A,C,5] [B,C,1]
       [B,D,2] [C,D,50]}.each do |edge_string|
      graph.add_edge IntegrationMocks::Edge.new(edge_string)
    end
    graph
  }
  let(:given_graph) {
    graph = Graph.new
    %w{[A,B,1] [A,C,2] [B,C,3] [B,D,3]
       [C,D,1] [B,E,2] [D,F,3] [D,E,3]
       [E,G,3] [F,G,1]}.each do |edge_string|
         graph.add_edge IntegrationMocks::Edge.new(edge_string)
       end
    graph
  }

  it "calculates the shortest path for a degenerate graph" do
    spf = ShortestPath.new degenerate_graph
    spf.calculate("A")
    spf.cost("C").must_be :==,4
    spf.path("C").must_be :==,["A","B","C"]
  end

  it "calculates the shortest path for the given graph" do
    spf = ShortestPath.new given_graph
    spf.calculate("A")
    spf.cost("G").must_be :==,6
    spf.path("G").must_be :==,["A","B","E","G"]
  end

end