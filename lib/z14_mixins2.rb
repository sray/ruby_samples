class Person
  include Comparable
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
  def to_s
    "#{@name}"
  end
  
  #required method by Comparable
  def <=>(other)
    self.name <=> other.name
  end
end

p1 = Person.new("Matz")
p2 = Person.new("Guido")
p3 = Person.new("Larry")

if p1 > p2
  puts "#{p1.name}'s name > #{p2.name}'s name"
end

puts "Sorted list:"
puts [p1,p2,p3].sort

require_relative('mixins/vowelfinder')

vf = VowelFinder.new("the quick brown fox jumped")
puts vf.inject(:+)