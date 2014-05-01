
def surround(word, padWidth=word.length/2)
  "[" * padWidth + word + "]" * padWidth  
end

puts surround("elephant")
puts surround("fox")
puts surround("fox",5)

def varargs(arg1, *rest)
  "arg1=#{arg1}. rest=#{rest.inspect}"
end

puts varargs("one")
puts varargs("one","two")
puts varargs("one","two","three")

class TaxCalculator
  def initialize(name, &block)
    @name, @block = name, block    
  end
  def getTax(amount)
    "#{@name} on #{amount} = #{@block.call(amount)}"
  end
end

tc = TaxCalculator.new("sales tax"){ |amt| amt*0.075 }
puts tc.getTax(100)
puts tc.getTax(250)

puts File.size("lib/testfile")
puts Math.sin(Math::PI/4)

def five(a,b,c,d,e)
  "I was passed #{a} #{b} #{c} #{d} #{e}"  
end

puts five(1,2,3,4,5)
puts five(1,2,3,*['a','b'])
# intermix works since ruby 1.9 
puts five(1,2,*['a','b'], 3)
puts five(*(10..14))
puts five(*[1,2],3,*(4..5))
  
def timesOrPlus(operator, number)
  if operator =~ /^t/
    calc = lambda { |n| n*number }
  else
    calc = lambda { |n| n+number }
  end
  puts ((1..10).collect(&calc).join(", "))
end

timesOrPlus('t',2)
timesOrPlus('p',2)

# Ruby 1.9.x and prior param hashmap handling 
def search(field, options)
  options =  { duration: 120  }.merge(options)
    if options.has_key?(:duration)
      duration = options[:duration]
        options.delete(:duration)
    end
  if options.has_key?(:genre)
        genre = options[:genre]
          options.delete(:genre)
      end
      fail "Invalid options: #{options.keys.join_options(', ')}" unless options.empty?
      #rest of method
end

# simplified param hashmap handling only available in Ruby 2 and higher 
#def search(field, genre: nil, duration: 120)
#  p [field, genre, duration]  
#end
#
#search(:title)
#search(:title, duration: 432)
#search(:title, duration: 432, genre: 'jazz')
#search(:title, duraton: 432)
