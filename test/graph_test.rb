require "test_helper"

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


end