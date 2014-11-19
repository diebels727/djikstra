require "djikstra/version"
require "graph"
require "edge"
require "shortest_path"

module Djikstra
  class Runner
    def syntax
      %s{
        Usage:

          djikstra <file name> <start vertex> <end vertex>

      }
    end

    def initialize(args)
      file_name = ARGV[0]||""
      @start_vertex = ARGV[1]||""
      @end_vertex = ARGV[2]||""

      unless File.exists?(file_name)
        puts "The file #{file_name} does not exist."
        puts syntax
        exit 1
      end

      @graph = Graph.new

      File.open(file_name) do |fh|
        fh.each_line do |line|
          line.chomp!
          line.gsub!(/[\[\]]/,"")
          tail,head,weight = line.split(",")
          edge = Edge.new tail,head,weight
          @graph.add_edge edge
        end
      end

      @spf = ShortestPath.new @graph
    end

    def execute!
      vertices = @graph.vertices

      if !vertices.include?(@start_vertex)
        puts "The vertex #{@start_vertex} is not in the graph."
        exit 1
      end

      if !vertices.include?(@end_vertex)
        puts "The vertex #{@end_vertex} is not in the graph."
        exit 1
      end

      @spf.calculate @start_vertex
      @spf.pretty_print @end_vertex
    end
  end
end
