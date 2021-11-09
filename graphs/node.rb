class Node
  attr_accessor :val, :neighbors

  def initialize(val)
    @val = val
    @neighbors = []
  end
end
