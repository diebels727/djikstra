require "test_helper"

class MockEdge
  attr_accessor :head,:tail,:weight
  def initialize(tail,head,weight)
    @head = head
    @tail = tail
    @weight = weight.to_i
  end
end

describe Graph do
  subject {Graph.new}
  it "creates an empty graph" do
    wont_be_nil
  end

  it "doesn't have vertices" do
    subject.vertices.must_be_empty
  end

  it "doesn't have edges" do
    subject.edges.must_be_empty
  end

  it "adds an edge" do
    edge = MockEdge.new("A","B",1)
    subject.add_edge(edge)
    subject.edges.size.must_be :==,1
    subject.vertices.size.must_be :==,2
  end

  it "represents a graph" do
    edge_strings = %w{[A,B,1] [A,C,2] [B,C,3] [B,D,3]
               [C,D,1] [B,E,2] [D,F,3] [D,E,3]
               [E,G,3] [F,G,1]}
    edge_strings.each do |edge_string|
      edge_string.gsub!(/[\[\]]/,"")
      tail,head,weight = edge_string.split(",")
      subject.add_edge MockEdge.new(tail,head,weight)
    end
  end

end