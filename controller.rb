
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
  response.body = fact_row[1]
  
  response
end

Router.register('post', /\/facts/) do |request|
   number_of_facts = CSV.readlines("facts.csv").length
   number_for_new_fact = (number_of_facts + 1).to_s
   new_fact = request.params[:fact]
    CSV.open("./facts.csv", "ab") do |csv|
        csv << [number_for_new_fact, new_fact]
   end 

    response = Response.new
    response.status = 200
    response.content_type = "text/html"
    response.body = request.body

    response
end 