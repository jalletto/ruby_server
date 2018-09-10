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
        self.routes << [method, path, block]
    end 

    def self.process(request)
        self.routes.find { |route| route[2] == request.path.match(route[1]).call(request)         
    end 
end 
