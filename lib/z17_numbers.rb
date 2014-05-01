num = 10001
4.times do
  puts "#{num.class} : #{num}"
  num *=num
end

puts Rational(3,4)* Rational(2,3)
puts Rational("3/4")* Rational("2/3")
puts Complex(1,2)*Complex(3,4)
puts Complex("1+2i")*Complex("3+4i")
puts (Complex("1+2i")*Complex("3+4i")).abs
  
class File
  def File.open_and_process(*args)
    f = File.open(*args)
    yield f
    f.close()
  end
end

f = File.open('lib/numberfile')
f.each do |line|
  v1,v2 = line.split
  print Integer(v1) + Integer(v2), " "
end
puts
puts 1.0/2
puts 1/2.0
puts 1/2
puts
3.times { print "X " }
1.upto(5) { |i| print "#{i} " }
99.downto(95) { |i| print "#{i} " }
50.step(80,5) { |i| print "#{i} " }
  puts
10.downto(7).with_index() {|num, index| puts "#{index}: #{num}" }

puts
puts 22/7
puts Complex::I * Complex::I
require 'mathn'
puts (22 / 7)
puts (Complex::I * Complex::I)