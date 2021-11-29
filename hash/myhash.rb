# frozen_string_literal: true

# High performant Hash clone implementation
class MyHash
  include Enumerable

  DEFAULT_CAPACITY = 16
  DEFAULT_LOAD_FACTOR = 0.75

  attr_reader :size

  def initialize
    initialize!
  end

  def []=(key, value)
    value_index = find_value_index(key)
    value_index ? edit_value(value_index, value) : add_entry(key, value)
  end

  def [](key)
    value_index = find_value_index(key)
    value_index.nil? ? nil : values[value_index]
  end

  def clear
    initialize!
  end

  def delete(key)
    value_index = find_value_index(key)
    if value_index
      keys[value_index] = nil
      values[value_index] = nil
    end
  end

  def each
    keys.each_with_index { |key, i| yield(key, values[i]) if key }
    self
  end

  private

  attr_accessor :capacity, :buckets, :keys, :values

  def initialize!
    @capacity = DEFAULT_CAPACITY
    @buckets = Array.new(DEFAULT_CAPACITY) { [] }
    @keys = []
    @values = []
    @size = 0
  end

  def bucket_index(key)
    key.hash % capacity
  end

  def find_bucket(key)
    buckets[bucket_index(key)]
  end

  def find_value_index(key)
    bucket = find_bucket(key)
    bucket.detect { |key_index| keys[key_index] == key }
  end

  def edit_value(index, value)
    values[index] = value
  end

  def add_entry(key, value)
    rebalance unless balanced?

    buckets[bucket_index(key)] << size
    keys << key
    values << value
    @size += 1
  end

  def load_factor
    size / capacity
  end

  def balanced?
    load_factor <= DEFAULT_LOAD_FACTOR
  end

  def rebalance
    @capacity = capacity * 2
    new_buckets = Array.new(capacity) { [] }
    keys.each_with_index do |key, i|
      if key
        index = bucket_index(key)
        new_buckets[index] << i
      end
    end
    @buckets = new_buckets
  end
end
