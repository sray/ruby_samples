module Summable
  # module requires Enumerable module
  def sum
    inject(:+)
  end
end

class Array
  include Summable
end

class Range
  include Summable
end

require_relative('mixins/vowelfinder')
class VowelFinder
  include Summable
end

puts [1,2,3,4,5].sum
puts ('a'..'m').sum
vf = VowelFinder.new("the quick brown fox jumped")
puts vf.sum
