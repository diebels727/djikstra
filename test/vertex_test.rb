require "test_helper"

describe Vertex do
  subject {Vertex.new Object.new}
  it "has an id" do
    subject.id.must_be_instance_of Object
  end

end