require_relative './node'

def dfs(node)
  p node.val

  node.neighbors.each do |neighbor|
    dfs(neighbor)
  end
end
