require "test_helper"

describe Edge do
  subject {Edge.new(Object.new,Object.new,Object.new)}
  it "has a tail" do
    subject.tail.must_be_instance_of Object
  end
  it "has a head" do
    subject.head.must_be_instance_of Object
  end
  it "has a weight" do
    subject.weight.must_be_instance_of Object
  end
end