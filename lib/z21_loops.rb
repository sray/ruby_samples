# To change this template, choose Tools | Templates
# and open the template in the editor.
## difference between while-loop and do-while-loop
i = 0
while i < 10
  puts "while-loop: #{i}"
  i += 1
end

# two ways of do-while-loop
m = 10
begin
  puts "does it work ? DO-while-loop: #{m}"
  m += 1
end while m < 10

m = 0
loop do
  puts "DO-while-loop: #{m}"
  m += 1
  break if m > 10
end

k = 0
until k>20
  puts "2nd #{k}"
  k += 1
end

for i in ['fee','fi','fo','fum']
  print(i, " ")
end

for i in 1..3
  print(i, " ")
end

class Periods
  def each
    yield "Classic"
    yield "Jazz"
    yield "Rock"
  end
end

periods = Periods.new
for genre in periods
  print genre, " "
end

puts
i=0
loop do
  i += 1
  next if i < 3
  print i
  break if i > 4
end

puts
x = "init"
y = "init"
[1,2,3].each do |x|
  y= x+1
  z=x+2
end
## causes undefined local var exception
#puts "#{x}, #{y}, #{z}"
## shows that y has been changed by the each-loop execution
puts "#{x}, #{y}"

#use explicit block-local var declarations to ensure the outer scope is not affected if you do not intend to
square = "yes"
total=0
[1,2,3].each do |val; square|
  #block scope var
  square = val*val
  #blocke scope square var is added to outer scope var total
  total += square
end
puts "Total = #{total}, square = #{square}"

