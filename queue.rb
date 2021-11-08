class Queue
  class EmptyQueueError < StandardError; end

  class QueueOverflowError < StandardError; end

  def initialize
    @store = []
  end

  def dequeue
    raise EmptyQueueError if empty?

    @store.pop
  end

  def enqueue(element)
    raise QueueOverflowError if full?

    @store.unshift(element)
    self
  end

  def size
    @store.size
  end

  private

  def full?
    @store.size >= @size
  end

  def empty?
    @store.empty?
  end
end
