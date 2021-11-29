# frozen_string_literal: true

require 'benchmark'
require_relative './myhash'
require_relative './turbohash'
require_relative './badhash'

n = 2_000_000
h1 = {}
h2 = MyHash.new
h3 = TurboHash.new
h4 = BadHash.new

puts 'Writing: '
Benchmark.bm(9) do |x|
  x.report('Hash:') { n.times { |i| h1[i.to_s] = i } }
  x.report('MyHash:') { n.times { |i| h2[i.to_s] = i } }
  x.report('TurboHash:') { n.times { |i| h3[i.to_s] = i } }
  x.report('BadHash:') { n.times { |i| h4[i.to_s] = i } }
end
puts '----------------'

puts 'Reading: '
Benchmark.bm(9) do |x|
  x.report('Hash:') { n.times { |i| h1[i.to_s] } }
  x.report('MyHash:') { n.times { |i| h2[i.to_s] } }
  x.report('TurboHash:') { n.times { |i| h3[i.to_s] } }
  x.report('BadHash:') { n.times { |i| h4[i.to_s] } }
end
puts '----------------'
