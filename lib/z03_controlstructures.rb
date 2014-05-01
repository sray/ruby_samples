today = Time.now

if today.saturday?
  puts "its saturday"
  elseif today.sunday?
  puts "its sunday"
  elseif today.monday?
  puts "its monday"
else
  puts "same shit, other day"
end

## enumerator objects
short_enum =[1,2,3].to_enum
long_enum =('a'..'z').to_enum

loop do
  puts "#{short_enum.next} - #{long_enum.next}"
end

result = []
"cat".each_char().with_index() { |item, index| result << [item, index] }
p result

enum = "cat".enum_for(:each_char)
p enum.to_a

enum_in_threes = (1..10).enum_for(:each_slice,3)
# is the same as:
# enum_in_threes = (1..10).each_slice(3)
p enum_in_threes.to_a

triangular_numbers = Enumerator.new do |yielder|
  number = 0
  count = 1
  loop do
    number += count
    count += 1
    yielder.yield number
  end
end

def inifinite_select(enum, &block)
  Enumerator.new do |yielder|
    enum.each do |value|
      if block.call(value)
        yielder.yield(value)
      end
    end
  end
end

5.times { print triangular_numbers.next(), " " }
puts
p triangular_numbers.first(5)
puts
p inifinite_select(triangular_numbers) {
|val| val % 10 == 0}.first(5)