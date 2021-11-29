# frozen_string_literal: true

# Simple implementation of Hash clone with bad O(N) reading complexity
class BadHash
  Entry = Struct.new(:key, :value)

  def initialize
    @table = Array.new(16) { [] }
  end

  def []=(key, value)
    @table[index_of(key)] << Entry.new(key, value)
  end

  def [](key)
    index = index_of(key)
    entry = @table[index].detect { |e| e.key == key }
    entry&.value
  end

  private

  def index_of(key)
    key.hash % @table.size
  end
end
