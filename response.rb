require 'date'

class Response
    attr_accessor :status, :content_type, :body 
    def initialize
        @http_verson = 'HTTP/1.1'
        @status = 500
        @content_type = ''
        @body = ''
    end 

    def to_s
        "HTTP/1.1 #{status}\r\nDate: #{Date.today}\r\nContent-Type: #{content_type}\r\n\r\n#{body}"
    end 
end 


# HTTP/1.1 200 OK
# Date: Mon, 27 Jul 2009 12:28:53 GMT
# Server: Apache/2.2.14 (Win32)
# Last-Modified: Wed, 22 Jul 2009 19:15:56 GMT
# Content-Length: 88
# Content-Type: text/html
# Connection: Closed