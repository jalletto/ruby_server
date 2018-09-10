# curl -i -X POST -H 'Content-Type: application/json' -d '{"name": "New item", "year": "2009"}' http://localhost:9292
# curl http://localhost:9292


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
    def get(path, opts = {}, &block)
        conditions = @conditions.dup
        route('GET', path, opts, &block)

        @conditions = conditions
        route('HEAD', path, opts, &block)
    end

    def route(verb, path, options = {}, &block)
        enable :empty_path_info if path == "" and empty_path_info.nil?
        signature = compile!(verb, path, block, options)
        (@routes[verb] ||= []) << signature
        invoke_hook(:route_added, verb, path, block)
        signature
    end

    def compile!(verb, path, block, **options)
        # Because of self.options.host
        host_name(options.delete(:host)) if options.key?(:host)
        # Pass Mustermann opts to compile()
        route_mustermann_opts = options.key?(:mustermann_opts) ? options.delete(:mustermann_opts) : {}.freeze

        options.each_pair { |option, args| send(option, *args) }

        pattern                 = compile(path, route_mustermann_opts)
        method_name             = "#{verb} #{path}"
        unbound_method          = generate_method(method_name, &block)
        conditions, @conditions = @conditions, []
        wrapper                 = block.arity != 0 ?
          proc { |a, p| unbound_method.bind(a).call(*p) } :
          proc { |a, p| unbound_method.bind(a).call }

        [ pattern, conditions, wrapper ]
      end


# r = case request.path 
#     when '/'
#         response = Response.new
#         response.status = 200
#         response.content_type = 'text/html'
        
#         name = 'jake'
#         renderer = ERB.new(get_view('index.html.erb'))
        
#         response.body = renderer.result()
#         response
#     when '/time'
#         response = Response.new
#         response.status = 200
#         response.content_type = 'text/html'

#         renderer = ERB.new(get_view('time.html.erb'))
#         response.body = renderer.result()
#         response
#     else 
#         response = Response.new
#         response.status = 404
#         response.content_type = 'text/plain' 
#         response.body = 'Your request was not found.'
#         response
#     end 

