require "test_helper"

module GraphMocks
  class Edge
    attr_accessor :head,:tail,:weight
    def initialize(tail,head,weight)
      @head = head
      @tail = tail
      @weight = weight.to_i
    end
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
    edge = GraphMocks::Edge.new("A","B",1)
    subject.add_edge(edge)
    subject.edges.size.must_be :==,1
    subject.vertices.size.must_be :==,2
  end

end