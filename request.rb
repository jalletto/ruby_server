require 'pry'

class Request
    attr_reader :request, :request_line
    attr_accessor :body
    
    def initialize(request_text)
        # remove our line return we won't need it.   
        request_text.pop
        @request = request_text
        @request_line = request.shift.split(' ')
        @body = ''
    end 

    def method 
        @request_line[0]
    end 

    def path
        request_line[1]        
    end 

    def url 
       headers[:host]
    end 

    def protocol
        request_line[2] 
    end 

    def headers
        request.reduce({}) do | request_hash, header|
            # split our string on space (tried splitting on colon but that was breaking up the url)
            arrayed_header = header.split(' ') 
            # prep our headers 
            header_title = arrayed_header[0].tr(':','').downcase
            
            header_title.sub!('-', '_') if header_title.include?('-')
                
            request_hash.update(header_title.to_sym => arrayed_header[1]) unless header == "\r\n"
        end 
    end 

    def params 
        if path.include?('?')
            params = path.split('?')[1].split('&').reduce({}) do |param_hash, param| 
                key_and_value = param.split('=')
                param_hash.update(key_and_value[0].to_sym => key_and_value[1])
            end 
        end 
        params 
    end 

    def accepts?(type)
        headers[:accept].include?(type)
    end 
     
end 



get_req  = [
    "GET /form?firstname=Mickey&lastname=Mouse HTTP/1.1\r\n", 
    "Host: localhost:9292\r\n", 
    "Connection: keep-alive\r\n", 
    "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36\r\n", 
    "Accept: image/webp,image/apng,image/*,*/*;q=0.8\r\n", 
    "Referer: http://localhost:9292/\r\n", 
    "Accept-Encoding: gzip, deflate, br\r\n", 
    "Accept-Language: en-US,en;q=0.9,es;q=0.8\r\n", 
    "\r\n"
]

# r = Request.new(get_req)
# binding.pry 