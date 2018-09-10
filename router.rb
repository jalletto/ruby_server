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
        self.routes.each do |route|
            return route[2].call(request) if request.path.match(route[1])        
        end  
    end 
end 
