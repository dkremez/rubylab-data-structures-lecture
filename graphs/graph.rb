require_relative './node'

class Graph
  attr_accessor :nodes

  def initialize
    @nodes = []
  end

  def add_node(name)
    @nodes << Node.new(name)
  end

  def count
    nodes.length
  end
end
