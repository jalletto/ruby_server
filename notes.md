Let's talk about the "specific format" of an HTTP request. Here's an example of an HTTP request string:

   ```
   GET /locations/chicago HTTP/1.1
   Host: devbootcamp.com
   Accept: text/html

   ```

As you can see, an HTTP request is a chunk of text (a string) that is composed of:

 * The resource (URL) being requested
 * Zero or more headers (Key: value)
 * A blank line