## Ruby Server 

A simple http server built for my own education. 

Run `ruby server.rb` to start the server on `http://localhost:9292`. 

Routes 
* /time returns current time.
* /facts displays a list of random facts read from a CSV file. 
* /facts/new a form to add a new fact to the list 
* /fact/:id to view a specific fact. 
