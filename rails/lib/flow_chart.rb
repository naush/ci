module FlowChart
  def self.create(words)
    nodes = words.split(/,|\n/).map(&:strip).reject(&:empty?)

    return {
      :nodes => nodes,
      :edges => edges(nodes, nodes.length)
    }
  end

  def self.edges(nodes, length)
    indices = (0...length).zip((1...length))
    indices.pop
    indices.map do |left, right|
      [nodes[left], nodes[right]]
    end.uniq
  end
end
