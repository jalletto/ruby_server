class Request
    
  attr_reader :request, :request_line
  attr_accessor :body
  
  def initialize(request_text)
    # remove our line return we won't need it.   
    request_text.pop
    @request = request_text
    @request_line = request.shift.split(' ')
    @body = nil
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

  def pars_params(params_string)
    params_string.split('&').reduce({}) do |param_hash, param| 
      key_and_value = param.split('=')
      key_and_value[1].gsub!('+',' ') if key_and_value[1].include?('+')
      param_hash.update(key_and_value[0].to_sym => key_and_value[1])
    end 
  end 

  def params 
    if path.include?('?')
      params = pars_params(path.split('?')[1])
    elsif body
      params = pars_params(body)
    end 
    params 
  end 

  def accepts?(type)
    headers[:accept].include?(type)
  end     
end 
