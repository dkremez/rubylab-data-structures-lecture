class Node
  attr_accessor :name, :neighbors

  def initialize(name)
    @name = name
    @neighbors = []
  end
end
