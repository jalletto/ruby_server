require 'socket'
require 'pry'
require 'erb'

def reload
    Dir["#{File.dirname(__FILE__)}/**/*.rb"].each do |file| 
        next if file == './' + __FILE__
        load file 
    end  
end 

tcp_server = TCPServer.new 9292
puts 'waiting for connection'


while connection = tcp_server.accept 
    reload 

    
    request_text = []

    request_text << connection.gets until request_text[-1] == "\r\n"
    
    request = Request.new(request_text)
    response = Router.process(request)
    connection.print response
    connection.close 
end 