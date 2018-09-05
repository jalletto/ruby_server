require 'socket'
require 'pry'

tcp_server = TCPServer.new 9292
puts 'waiting for connection'


while connection = tcp_server.accept 

    Dir["#{File.dirname(__FILE__)}/**/*.rb"].each do |file| 
        next if file == './' + __FILE__
        load file 
    end  
    request = []

    request << connection.gets until request[-1] == "\r\n"
    
    puts 'new connection received'
    connection.print "HTTP/1.1 200\r\n" # 1
    connection.print "Content-Type: text/html\r\n" # 2
    connection.print "\r\n" # 3
    connection.print get_response 
    connection.close 
end 