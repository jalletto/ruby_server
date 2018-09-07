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