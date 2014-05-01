require 'socket'

#client = TCPSocket.open("bizware.spree.de","www")
#client.send("OPTIONS /~dave/ HTTP/1.0\n\n", 0)
#puts client.readlines
#client.close

require 'net/http'

http = Net::HTTP.new('pragprog.com',80)
response = http.get('/book/ruby3/programming-ruby-1-9')
if response.message == "OK"
  puts response.body.scan(/<img alt=".*?" src=".*?"/m).uniq[0,3]
end

require 'open-uri'
open('http://pragprog.com') do |f|
  puts f.read.scan(/<img alt=".*?" src=".*?"/m).uniq[0,3]
end

page = open('http://pragprog.com/titles/ruby3/programming-ruby-1-9').read
if page =~ %r{<title>(.*?)</title>}m
  puts "Title is #{$1.inspect}"
end

require 'nokogiri'
doc = Nokogiri::HTML(open("http://pragprog.com/"))
puts "Page title is " + doc.xpath("//title").inner_html