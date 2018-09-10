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