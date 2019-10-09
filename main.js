// load the http module

var http = require('http');

// configure our HTTP server

var server = http.createServer(function (request, response) {

  response.writeHead(200, {"Content-Type": "text/plain"});

  response.end("Hello... The source of this Jenkins pipeline executed inside a Docker container is located at github.com/PA2019/JenkinsDockerNode\n");

});

// listen on localhost:8000

server.listen(8000);

console.log("4WD Local Server listening at http://127.0.0.1:8000/");
