require "test_helper"

describe Graph do
  subject {Graph.new}
  it "creates a new graph" do
    must_not_be_nil
  end
end