require 'socket'
require 'pry'

tcp_server = TCPServer.new 9292
puts 'waiting for connection'


while connection = tcp_server.accept 

    Dir["#{File.dirname(__FILE__)}/**/*.rb"].each do |file| 
        next if file == './' + __FILE__
        load file 
    end  
    request_text = []

    request_text << connection.gets until request_text[-1] == "\r\n"
    request = Request.new(request_text)
    puts request.path
    puts 'new connection received'
    # Our client is expecting these lines before our content 
    connection.print "HTTP/1.1 200\r\n" # 1
    connection.print "Content-Type: text/html\r\n" # 2
    connection.print "\r\n" # 3
    
    response = case request.path 
    when '/'
        'hello'
    when '/time'
        Time.now 
    end 
   
    connection.print response
    connection.close 
end 