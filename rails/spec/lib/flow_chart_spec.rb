require 'flow_chart'
require 'graphviz'

describe FlowChart do
  describe "nodes" do
    it "has one node" do
      words = 'word'
      chart = FlowChart.create(words)
      chart[:nodes].should == ['word']
    end

    it "delimits by comma" do
      words = 'alpha, beta'
      chart = FlowChart.create(words)
      chart[:nodes].should == ['alpha', 'beta']
    end

    it "delimits by line breaks" do
      words = "alpha\nbeta"
      chart = FlowChart.create(words)
      chart[:nodes].should == ['alpha', 'beta']
    end

    it "removes empty lines" do
      words = "alpha\n\nbeta"
      chart = FlowChart.create(words)
      chart[:nodes].should == ['alpha', 'beta']
    end
  end

  describe "edges" do
    it "has an edge" do
      words = "alpha\nbeta"
      chart = FlowChart.create(words)
      chart[:edges].should == [['alpha', 'beta']]
    end

    it "has two edges for two nodes" do
      words = "alpha\nbeta\ncharlie"
      chart = FlowChart.create(words)
      chart[:edges].should == [['alpha', 'beta'], ['beta', 'charlie']]
    end

    it "does not duplicate edge" do
      words = "alpha\nbeta\nalpha\nbeta"
      chart = FlowChart.create(words)
      chart[:edges].should == [['alpha', 'beta'], ['beta', 'alpha']]
    end
  end
end
