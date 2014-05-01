def call_block
  puts "Start block"
  yield
  yield
  puts "End block"
end
call_block { puts "In the block" }

def three_times
  yield
  yield
  yield
end

three_times{ puts "Hello" }

def who_says_what
  yield("Dave","hello")    
  yield("Andy","goodbye")
end

who_says_what { |person, phrase| puts "#{person} says #{phrase}" }
  
['cat','dog','horse'].each { |name| print name, "" }
5.times { print "*" }
3.upto(6) { |i| print i }
('a'..'e').each { |char| print char }
puts
  
def fib_up_to(max)
  i1,i2 = 1,1
  while i1 <=max
    yield i1
    i1,i2=i2,i1+i2
  end
end

fib_up_to(1000){ |f| print f, " " }

puts
a = [1,2]
b = 'cat'
a.each { |b| c = b*a[1] }
puts a
puts b
puts defined?(c)

puts ["H","A","L"].each { |x| x.succ }.to_s
puts ["H","A","L"].collect { |x| x.succ }.to_s

  #inject(first_var_in_block) { |first_var_in_block, element_in_collection| ... }
puts [1,3,5,7].inject(0){|sum,element| sum+element}
puts [1,3,5,7].inject(0){|prod,element| prod*element}
puts [1,3,5,7].inject(1){|prod,element| prod*element}

  
  puts "---block-var-scope-I---"
square="some shape"
value="some value"
[1,2,3,4].each { |value| puts square=value*value }
  puts "---"
puts value
puts square
puts "---block-var-scope-II---"
sum=0
square="some shape"
[1,2,3,4].each do |value|
    square = value*value
    sum += square
end
puts sum
puts square
puts "---block-var-scope-III---"
sum=0
square="some shape"
[1,2,3,4].each do |value; square|
    square = value*value
    sum += square
end
puts sum
puts square

## blocks as Proc objects
class ProcExam
  def passInBlock(&action)
    @storedProc = action
  end
  def useBlock(params)
      @storedProc.call(params)
    end    
end

eg = ProcExam.new
eg.passInBlock { |param| puts "The param is #{param}" }
eg.useBlock(99)

#lambda is a short form of method def create_block_object (&block) which returns simply the block
bo = lambda { |param| puts "You called me with #{param}" }
  bo.call 99
  bo.call "cat"
  
  def nTimes(thing)    
    lambda{|n| print thing * n, " "}      
  end

p1 =nTimes(23)
p1.call(2)
p1.call(3)
p1.call(4)
p2 = nTimes("Hi ")
p2.call(3)

def powerProcGen
  value = 1
  lambda { value += value }    
end

pp = powerProcGen()
puts
puts pp.call
puts pp.call
puts pp.call
puts pp.call

## another form is the -> *params {..} form
proc1 = -> arg { puts "proc1: #{arg}" }
proc2 = -> arg1,arg2 { puts "proc2: #{arg1}, #{arg2}" }
proc3 = ->(arg1,arg2) { puts "proc2: #{arg1}, #{arg2}" }
proc1.call("ant")
proc2.call("bee","gee")
proc3.call("dog","shit")
      
def myIf(cond, thenClause, elseClause)
  if cond
    thenClause.call
  else
  elseClause.call
  end
end

5.times do |val|
  myIf(val<2,-> {puts("#{val} is small")},->{puts("#{val} is big")})
end
# generator can not be loaded by ruby 1.9  
#require 'generator'
#
#gen = Generator.new(1..4)
#while gen.next?
#  print gen.next, "--"
#end
#puts
#gen = SyncEnumerator.new(1..3,"a".."c")
#gen.each{|num,ch| print num, "(", ch, ")"}
#  
