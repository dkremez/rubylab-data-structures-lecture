class Stack
  class EmptyStackError < StandardError; end

  class StackOverflowError < StandardError; end

  def initialize(size)
    @store = []
    @size = size
  end

  def pop
    raise EmptyStackError if empty?

    @store.pop
  end

  def push(element)
    raise StackOverflowError if full?

    @store.push(element)
    self
  end

  def size
    @store.size
  end

  def top
    @store.last
  end

  private

  def full?
    @store.size >= @size
  end

  def empty?
    @store.empty?
  end
end
