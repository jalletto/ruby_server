require 'webrick'

class Request
    attr_reader :request, :request_line
    
    def initialize(request_text)
        # remove our line return we won't need it. 
        request_text.pop 
        @request = request_text
        @request_line = request.shift.split(' ')
    end 

    def method 
        @request_line[0]
    end 

    def path
        request_line[1]        
    end 

    def url 
       host = request.find { | header | header.include? 'Host'}.split(' ')[1]
    end 

    def protocol
        request_line[2] 
    end 

    def headers
        request.reduce({}) do | hash, header|
            h = header.split(' ') 
            key = h[0].tr(':','').downcase
            if key.include?('-')
                key.sub!('-', '_')
            end 
            hash.update(key.to_sym => h[1]) if header != "\r\n"
        end 
    end 

    def accepts?(type)
    end 
    
    
end 

get_req  = [
    "GET /favicon.ico HTTP/1.1\r\n", 
    "Host: localhost:9292\r\n", 
    "Connection: keep-alive\r\n", 
    "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36\r\n", 
    "Accept: image/webp,image/apng,image/*,*/*;q=0.8\r\n", 
    "Referer: http://localhost:9292/\r\n", 
    "Accept-Encoding: gzip, deflate, br\r\n", 
    "Accept-Language: en-US,en;q=0.9,es;q=0.8\r\n", 
    "\r\n"
]

post_req = [
    "POST / HTTP/1.1\r\n", 
    "Host: localhost:9292\r\n", 
    "Connection: keep-alive\r\n", 
    "Content-Length:31\r\n", 
    "Cache-Control: max-age=0\r\n", 
    "Origin: http://localhost:9292\r\n", 
    "Upgrade-Insecure-Requests: 1\r\n", 
    "Content-Type: application/x-www-form-urlencoded\r\n", 
    "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36\r\n", 
    "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8\r\n", 
    "Referer: http://localhost:9292/\r\n", 
    "Accept-Encoding: gzip, deflate, br\r\n", 
    "Accept-Language: en-US,en;q=0.9,es;q=0.8\r\n", 
    "\r\n"
]

get  = Request.new(get_req)
post = Request.new(post_req)

p get.headers
p post.protocol 

# request.reduce({}) do | acum, header|
#     vals = header.split(/^(.*?):/)
#     acum.update(vals[0] => vals[1])
# end 

