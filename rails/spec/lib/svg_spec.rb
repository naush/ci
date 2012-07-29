require 'svg'

describe SVG do
  it "has a node" do
    chart = { :nodes => ['word'], :edges => [] }
    svg = SVG.new(chart)
    svg.nodes.should include('word')
  end

  it "has every node" do
    chart = { :nodes => ['my', 'word'], :edges => [] }
    svg = SVG.new(chart)
    svg.nodes.should include('my')
    svg.nodes.should include('word')
  end

  it "has an edge" do
    chart = { :nodes => [], :edges => [['my', 'word']] }
    svg = SVG.new(chart)
    svg.edges.should include(['my', 'word'])
  end

  it "has every edge" do
    chart = { :nodes => [], :edges => [['my', 'word'], ['word', 'fails']] }
    svg = SVG.new(chart)
    svg.edges.should include(['my', 'word'])
    svg.edges.should include(['word', 'fails'])
  end

  it "saves the file" do
    file_path = File.expand_path(File.join(File.dirname(__FILE__), "..", "fixtures", "test.svg"))
    File.delete(file_path) if File.exists?(file_path)

    chart = { :nodes => ['my', 'word'], :edges => [['my', 'word']] }
    svg = SVG.new(chart)
    svg.save(file_path)
    File.exist?(file_path).should be_true

    File.delete(file_path)
  end
end
