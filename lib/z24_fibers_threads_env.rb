counts = Hash.new(0)
File.foreach("testfile") do |line|
  line.scan(/\w+/) do |word|
    word = word.downcase
    counts[word] += 1
  end
end

counts.keys.sort.each { |k| puts "#{k}: #{counts[k]}" }

words = Fiber.new do
  File.foreach("testfile") do |line| 
    line.scan(/\w+/) do |word|
      Fiber.yield word.downcase
    end
  end
end

counts = Hash.new(0)
while word = words.resume
  counts[word] += 1
end

counts.keys.sort.each { |k| puts "#{k}: #{counts[k]}" }

require 'net/http'

pages = %w( www.rubycentral.org slashdot.org www.google.com )

threads = pages.map do |page|
  ## page is passed as renamed param "url" because otherwise all three threads
  ## would access the same variable page of the surrounding parent thread scope
  ## and that would not be thread safe because the variable would be overwritten
  ## concurrently by all three threads  
  th = Thread.new(page) do |url|
    http = Net::HTTP.new(url, 80)
    ## behind the scenes puts processes two steps write the arg and then the newline
    ## therefore it's better to use print with a newline directly
    print "Fetching: #{url}\n"
    resp = http.get('/')
    print "Got: #{url}\n"
  end
  print Thread.list, "\n"
  th[:name]="#{page.gsub("www.","").gsub(".com","").gsub(".org","")}"
  for thread in Thread.list do
    print " #{thread[:name]} :: #{thread.status} , #{thread.alive?} , #{thread.priority} \n"
  end
  th
end

## make sure all three requests have completed before termination of calling thread
threads.each { |thr| thr.join  }

#Thread.abort_on_exception=true
threads = 4.times.map do |number|
  th =Thread.new(number) do |i|    
    if i==1
      raise "Boom!"
    end
    print "#{i}\n"    
  end
  th[:name]="#{number}"
  th
end

puts "Waiting\n"
threads.each do |t|
  begin
    t.join
  rescue RuntimeError => e
    puts "Failed thread #{t[:name]}: #{e.message}"
  end
end
puts "Done"

sum = 0
threads = 10.times.map do
  Thread.new do
    1000000.times do
      new_value = sum +1
      if new_value % 200000 == 0
        print "#{new_value} "
      end
      sum = new_value
    end
  end
end

for thread in threads do
  thread.join
end
puts "\nsum = #{sum}"

sum = 0
mutex = Mutex.new
threads = 10.times.map do
  Thread.new do
    10000.times do
      mutex.lock
      # "lock ... unlock" is the same as: 
      # mutex.synchronize do 
      #   ...
      # end
      new_value = sum +1
      if new_value % 25000 == 0
        print "#{new_value} "
      end
      sum = new_value
      mutex.unlock
    end
  end
end

for thread in threads do
  thread.join
end
puts "\nsum = #{sum}"

require 'open3'

pig = IO.popen("/bin/sh","w+")
pig.puts "/bin/echo nomnom"
pig2 = IO.popen("/bin/echo nomnom2","r")
pig.close_write
puts "result of process #{pig2.pid}: ", pig2.gets
puts "result of process #{pig.pid}: ", pig.gets

stdin, stdout, stderr, wait_thr = Open3.popen3("/bin/sh")
stdin.puts "date"
stdin.puts "doesnotwork"
stdin.close

exit_status = wait_thr.value
puts "result of process with exit status #{exit_status}: ", stdout.gets , "\n", "Errors: \n", stderr.gets
stdout.close
stderr.close

## does not work on win machines
pipe = IO.popen("-","w+")
if pipe
  ## executed in parent process
  pipe.puts "Get a job!"
  STDERR.puts "Child says '#{pipe.gets.chomp}'"
else
  ## executed in child process
  STDERR.puts("Dad says '#{gets.chomp}'")
  puts "OK"
end

IO.popen('echo "jo $(date)"') { |f| puts f.gets }

## trap just works with one parallel subprocess 
## just the first terminating subprocess is tracked by the trap
## more traps do just overwrite the previous trap blocks
trap("CLD") do
  pid= Process.wait
  puts "Child A pid #{pid}: terminated"  
end

trap("CLD") do
  pid= Process.wait
  puts "Child B pid #{pid}: terminated"  
end

trap("CLD") do
  pid= Process.wait
  puts "Child C pid #{pid}: terminated"  
end

fork { exec("echo dumbo; sleep 8") }
fork { exec("echo dumbo2") }
fork { exec("echo dumbo3; sleep 2") }

puts "In parent, term = #{ENV['TERM']}"
fork do
  puts "Start of child 1, term = #{ENV['TERM']}"
  ENV['TERM'] = "ansi"
  fork do
    puts "Start of child 2, term = #{ENV['TERM']}"
  end
  Process.wait
  puts "End of child 1, term = #{ENV['TERM']}"
end

Process.wait
puts "Back in parent, term = #{ENV['TERM']}"