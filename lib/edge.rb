class Edge
  attr_reader :tail,:head,:weight
  def initialize(tail,head,weight)
    @tail = tail
    @head = head
    @weight = weight.to_i
  end
end