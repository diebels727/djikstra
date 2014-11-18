require "test_helper"

class MockEdge
  attr_accessor :head,:tail,:weight
  def initialize(tail,head,weight)
    @head = head
    @tail = tail
    @weight = weight.to_i
  end
end

describe ShortestPath do
  subject {ShortestPath.new(graph)}
  let(:graph) {Graph.new}
  let(:edge_strings) {
    %w{[A,B,1] [A,C,2] [B,C,3] [B,D,3]
       [C,D,1] [B,E,2] [D,F,3] [D,E,3]
       [E,G,3] [F,G,1]}
  }
  it "calculates the shortest path" do
    edge_strings.each do |edge_string|
      edge_string.gsub!(/[\[\]]/,"")
      tail,head,weight = edge_string.split(",")
      graph.add_edge MockEdge.new(tail,head,weight)
    end
    binding.pry
  end

end