require 'set'

class ShortestPath
  def initialize(graph)
    @graph = graph
    @visited = Set.new([])
    @vertices = Set.new(@graph.vertices)
    @edges = @graph.edges
  end

  def candidates
    @edges.select { |edge|
      @visited.include?(edge.tail) && !@visited.include?(edge.head)
    }
  end

  def calculate(start_vertex)
    @min = {}
    min_candidate = nil
    @visited << start_vertex
    @min[start_vertex] = 0

    @frontier = @vertices - @visited
    @frontier.each do |v|
      @min[v] = Float::INFINITY
    end

    while @visited != @vertices do
      @frontier = @vertices - @visited

      min_weight = Float::INFINITY

      edges = candidates.each do |candidate|
        current_weight = @min[candidate.tail] + candidate.weight
        if current_weight < min_weight
          min_candidate = candidate
          min_weight = current_weight
        end
      end

      @min[min_candidate.head] = min_weight
      @visited << min_candidate.head
    end
  end

end