require 'graphviz'

class SVG
  def initialize(chart)
    @graph = GraphViz.new(:G, :type => :digraph)

    chart[:nodes].each do |node|
      @graph.add_nodes(node)
    end

    chart[:edges].each do |left, right|
      @graph.add_edges(left, right)
    end
  end

  def nodes
    nodes = []
    @graph.each_node do |node|
      nodes << node
    end
    return nodes
  end

  def edges
    edges = []
    @graph.each_edge do |edge|
      edges << [edge.node_one, edge.node_two]
    end
    return edges
  end

  def save(file_path)
    @graph.output(:svg => file_path)
  end
end
