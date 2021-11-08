require_relative './node'

def bfs(node)
  queue = []
  queue.push(node)
  while queue.size != 0
    node = queue.shift
    p node.val
    node.neighbors.each do |neighbor|
      queue.push(neighbor)
    end
  end
end
