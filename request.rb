
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
            if header_title.include?('-')
                header_title.sub!('-', '_')
            end 
            request_hash.update(header_title.to_sym => arrayed_header[1]) if header != "\r\n"
        end 
    end 

    def accepts?(type)
        headers[:accept].include?(type)
    end 
     
end 

