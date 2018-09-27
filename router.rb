require 'csv'

class Router 
   
    @@routes = []
    
    def self.routes
        @@routes
    end 

    def self.routes=(route_info)
        @@routes << route_info
    end 

    def self.register(method, path, &block)
        self.routes << { method: method, path: path, block: block }
    end 

    def self.process(request)
      requested_route = self.routes.find do |route| 
           request.method.downcase == route[:method] && request.path.match(route[:path]) 
      end        
      requested_route ? requested_route[:block].call(request) : "HTTP/1.1 404 Not Found \r\n"
    end 

end 


