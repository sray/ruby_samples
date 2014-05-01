arr=[1,2]
hash = { arr => "value"}
puts "value = #{hash[arr]}"
arr[0]=99
puts "value = #{hash[arr]}"
## rehash required so that object reference matches object key in hash map
hash.rehash
puts "value = #{hash[arr]}"

require 'benchmark'
include Benchmark

LOOP_COUNT = 1_000_000

#bmbm runs benchmark test twice
bmbm(12) do |test|
  test.report("inline:") do
    LOOP_COUNT.times do |x|
      #nothing
    end
  end
  test.report("method:") do
    def method
      
    end
    
    LOOP_COUNT.times do |x|
      #method call
      method
    end
  end
end