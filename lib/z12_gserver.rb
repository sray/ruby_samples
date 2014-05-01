#!/usr/bin/ruby
require 'gserver'

class LogServer < GServer
  
  def initialize
    super(12345)
  end
  
  def serve(client)
    client.puts getEndOfLogFile
  end
  
  private
  
  def getEndOfLogFile
    File.open("/var/log/syslog") do |log|
      log.seek(-500, IO::SEEK_END)
      log.gets
      log.read
    end
  end
end

server = LogServer.new
server.start.join