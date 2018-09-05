def get_response
    '<html><body><form action="/" method="POST">First name:<br>
  <input type="text" name="firstname" value="Mickey">
  <br>
  Last name:<br>
  <input type="text" name="lastname" value="Mouse">
  <br><br>
  <input type="submit" value="Submit">
</form> </body></html>' 
end 

# curl -i -X POST -H 'Content-Type: application/json' -d '{"name": "New item", "year": "2009"}' http://localhost:9292
