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
    %w{[A,B,3] [A,C,5] [B,C,1]
       [B,D,2] [C,D,50]}
  }
  it "calculates the shortest path" do
    edge_strings.each do |edge_string|
      edge_string.gsub!(/[\[\]]/,"")
      tail,head,weight = edge_string.split(",")
      graph.add_edge MockEdge.new(tail,head,weight)
    end
    subject.calculate("A")
    binding.pry
  end

end