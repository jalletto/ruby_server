Router.register('get', /\/form/) do |request|
    response = Response.new
    response.status = 200
    response.content_type = "text/html"
    renderer = ERB.new(get_view('form.html.erb'))
    response.body = renderer.result()
    response
end 


Router.register('get', /\/time/) do |request|
    response = Response.new
    response.status = 200
    response.content_type = "text/html"
    renderer = ERB.new(get_view('time.html.erb'))
    response.body = renderer.result()
  
    response
end 

Router.register('post', /\/user/) do |request|
    response = Response.new
    response.status = 200
    response.content_type = "text/html"
    response.body = request.body

    response
end 