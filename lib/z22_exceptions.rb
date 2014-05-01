word_list=['my','name','is','joe','*wow*']

malformed = catch :done do
  result = []
  word_list.each do |word|  
    wordx = word.chomp
    throw(:done,word) unless word =~ /^\w+$/
    result << word
  end
  puts result.reverse
end

if malformed
  puts "Failed: '#{malformed}' found, but simple word expected"
end

class NotASimpleWordException < StandardError
  
end

def reverseWordList(wordList)
  wordList.each do |word|
    wordx = word.chomp
    raise NotASimpleWordException, "malformed word: #{wordx}, reverseWordList aborted!"
  end
  result.reverse
end

begin
  reverseWordList(word_list)
rescue NotASimpleWordException => ex
  puts "caught exception oject: " 
  puts ex
ensure
  puts "make sure this code block is executed after the exception handling"
end

def promptAndGet(prompt)
  print prompt
  res = readline.chomp
  throw :quit_requested if res == "!"
  res
end

catch :quit_requested do
  name=promptAndGet("name:")
  age=promptAndGet("age:")
end