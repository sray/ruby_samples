a = [3.14159, "pie", 99]
puts a.class
puts a.length
puts a[0]
puts a[1]
puts a[2]
puts a[3]

b = Array.new
puts b.class
puts b.length
b[0] = "second"
b[1] = "array"
puts b.to_s

a = [1,3,5,7,9]
puts a[-1]
puts a[-2]
puts a[-99]
puts a[1,3].to_s
puts a[3,1].to_s
puts a[-3,2].to_s
puts a[1..3].to_s
puts a[1...3].to_s
puts a[3...3].to_s
puts a[-3..-1].to_s
puts a[-1..-3].to_s

a[1]='bat'
a[3]=[9,8]
a[10]=99
a[2,2]='cat'
a[1,1]=['added','more','elements','this','will','be removed by the next command']
a[4..6]=[]
puts a.to_s

h = {  'dog' => 'caine', 'cat' => 'feline', 'donkey' => 'asinine' }
puts h.length()
puts h['dog']
h['cow'] = 'bovine'
h[12] = 'dodecine'
h['cat'] = 99
puts h.to_s

# create hash map with default value
histogram = Hash.new(0)
puts histogram['rst']
histogram['rst'] = histogram['rst'] +1
puts histogram['rst']

# using symbols in hash maps as keys
inst_section = {
  cello: 'string',
  :clarinet => 'woodwind'
}

puts "A cello is a #{inst_section[:cello]} instrument."
puts "A clarinet is a #{inst_section[:clarinet]} instrument."

## using array as a stack
stack = []
stack.push("red")
stack.push("green")
stack.push("blue")
p stack
puts "pop:"+stack.pop
puts "pop:"+stack.pop
puts "pop:"+stack.pop
p stack

## using array as fifo queue
queue = []
queue.push("red")
queue.push("green")
queue.push("blue")
p queue
puts "shift:"+queue.shift()
puts "shift:"+queue.shift()
puts "shift:"+queue.shift()
p queue

def words_from_string(string)
  string.downcase.scan(/[\w']+/)
end

p words_from_string("But I didn't inhale, he said (emphatically)")

def count_frequency(word_list)
  counts = Hash.new(0)
  for word in word_list
    counts[word] += 1
  end
  counts.sort_by {|word, count| count}
end

counts = count_frequency(["sparky","the","cat","sat","on","the","mat"])
counts.each do |word,count|
  puts "#{word}: #{count}"
end