require 'erb'

def greeting
  name = 'joe'
  greeting = "<html><body><h1>Hello, <%= name %> </h1></body></html>"
    
  renderer = ERB.new(greeting)
  renderer.result()
end 

def my_form
  %{ 
  <html>
  <body>
    <form action="/" method="POST">First name:<br>
      <input type="text" name="firstname" value="Mickey">
      <br>
      Last name:<br>
      <input type="text" name="lastname" value="Mouse">
      <br><br>
      <input type="submit" value="Submit">
    </form> 
  </body>
  </html> 
  }
end 

