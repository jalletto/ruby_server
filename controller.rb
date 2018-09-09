require 'date'
Router.register('get', /\/time/) do |request|
    response = Response.new
    response.status = 200
    response.content_type = "text/html"
    renderer = ERB.new(get_view('time.html.erb'))
    response.body = renderer.result()
  
    response
end 

Router.register('get', /\/day/) do |request|
    response = Response.new
    response.status = 200
    response.content_type = "text/plain"
    response.body = 
  
    response
end 

