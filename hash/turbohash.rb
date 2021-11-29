# frozen_string_literal: true

# Hash clone implementation example from Heroku 2.4 Hash updates Ruby articale
class TurboHash
  STARTING_BINS = 16

  attr_accessor :table

  def initialize
    @max_density = 5
    @entry_count = 0
    @bin_count = STARTING_BINS
    @table = Array.new(@bin_count) { [] }
  end

  def grow
    # use bit shifting to get the next power of two and reset the table size
    @bin_count = @bin_count << 1

    # create a new table with a much larger number of bins
    new_table = Array.new(@bin_count) { [] }

    # copy each of the existing entries into the new table at their new location,
    # as returned by index_of(key)
    @table.flatten(1).each { |entry| new_table[index_of(entry.first)] << entry }

    # Finally we overwrite the existing table with our new, larger table
    @table = new_table
  end

  def full?
    # our bins are full when the number of entries surpasses 5 times the number of bins
    @entry_count > @max_density * @bin_count
  end

  def [](key)
    find(key).last
  end

  def find(key)
    bin_for(key).find { |entry| key == entry.first }
  end

  def bin_for(key)
    @table[index_of(key)]
  end

  def index_of(key)
    # use @bin_count because it now changes each time we resize the table
    key.hash % @bin_count
  end

  def []=(key, value)
    entry = find(key)

    if entry
      entry[1] = value
    else
      # grow the table whenever we run out of space
      grow if full?

      bin_for(key) << [key, value]
      @entry_count += 1
    end
  end
end
