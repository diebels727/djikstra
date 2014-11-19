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
    @start_vertex = start_vertex
    @visited << @start_vertex
    @min[@start_vertex] = 0
    @path = {}
    @path[@start_vertex] = []

    initialize_frontier(@min)

    while @visited != @vertices do
      @frontier = @vertices - @visited

      min_candidate,min_cost = calculate_min(@min)

      @min[min_candidate.head] = min_cost
      @path[min_candidate.head] = (@path[min_candidate.tail].dup||[]) << min_candidate.head
      @visited << min_candidate.head
    end
  end

  def path(vertex)
    [@start_vertex] + @path[vertex]
  end

  def cost(vertex)
    @min[vertex]
  end

private

  def initialize_frontier(min)
    @frontier = @vertices - @visited
    @frontier.each do |v|
      @min[v] = Float::INFINITY
    end
  end

  def calculate_min(min)
    min_cost = Float::INFINITY
    min_candidate = nil
    candidates.each do |candidate|
      current_cost = min[candidate.tail] + candidate.weight
      if current_cost < min_cost
        min_candidate = candidate
        min_cost = current_cost
      end
    end
    return min_candidate,min_cost
  end

end