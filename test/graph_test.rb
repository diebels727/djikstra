require "test_helper"

class MockEdge
  attr_accessor :head,:tail,:weight
  def initialize(head,tail,weight)
    @head = MockVertex.new head
    @tail = MockVertex.new tail
    @weight = weight
  end
end

class MockVertex
  attr_accessor :id
  def initialize(id)
    @id = id
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

end