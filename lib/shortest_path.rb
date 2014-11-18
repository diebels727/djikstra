require 'set'

class ShortestPath
  def initialize(graph)
    @graph = graph
    @visited = Set.new([])
    @vertices = Set.new(@graph.vertices)
  end

  def candidates
    @visited.map do |tail|
      vertices = @graph.edges_at(tail)
      vertices.map do |edge|
        edge if @frontier.include?(edge.head)
      end
    end.flatten.compact
  end

  def calculate(start_vertex)
    min = {}
    @visited << start_vertex
    min[start_vertex] = 0

    @frontier = @vertices - @visited
    @frontier.each do |v|
      min[v] = Float::INFINITY
    end

    while @visited != @vertices do
      @frontier = @vertices - @visited
      edges = candidates.map do |candidate|
        current_weight = min[candidate.tail] + candidate.weight
        old_weight = min[candidate.head]
        binding.pry
        if current_weight < old_weight
          min[candidate.head] = current_weight
        end
        binding.pry
        @visited << candidate.head
      end
    end
  end

end