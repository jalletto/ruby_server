require 'csv'

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

Router.register("get", /\/facts\/(\d+)/) do |request|
  fact_id = /\/facts\/(\d+)/.match(request.path)[1]
  fact_row = CSV.readlines("facts.csv").find do |row|
    row[0] == fact_id
end
  
  response = Response.new
  response.status = 200
  response.content_type = "text/plain"
  response.body = fact_row[2]
  
  response
end

Router.register('post', /\/user/) do |request|
    response = Response.new
    response.status = 200
    response.content_type = "text/html"
    response.body = request.body

    response
end 