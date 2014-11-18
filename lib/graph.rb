class Graph
  class AdjacencyList
    def initialize()
      @adjacency_list = {}
    end
    def <<(edge)
      tail = edge.tail
      head = edge.head
      tail_id = tail.id
      head_id = head.id
      @adjacency_list[tail_id] = (@adjacency_list[tail_id]||[]) << edge
      @adjacency_list[head_id] = @adjacency_list[head_id] || []
    end
    def vertices
      @adjacency_list.keys
    end
  end

  def initialize()
    #I chose to represent a graph as an adjacency list; O(m+n) in memory
    #  but, there may be other ways and reasons to represent a graph differently.
    #  so let's not couple ourselves too tightly to and adj list
    @graph_representation = AdjacencyList.new
    @edges = []
  end

  def vertices
    @graph_representation.vertices
  end

  def edges
    @edges
  end

  def add_edge(edge)
    @graph_representation << edge
    @edges << edge
  end

end