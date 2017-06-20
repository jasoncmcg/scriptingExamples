"use strict";

const fs = require('fs');
const exec = require('child_process').exec;

fs.readFile('./config.json', 'utf8', function(err, data) {
  if (err) {
    console.log("config file not found");
  }
  eachServer(JSON.parse(data));
});

function eachServer(config) {
  for (var i = 0, n = config.servers.length; i < n; i++) {
    queryUser(config.username, config.servers[i]);
  }
}

function queryUser(username, servername) {
  var cmd = "query user /server:" + servername;
  exec(cmd, function(err, stdout, stderr) {
    if (stdout.match(username)) {
      console.log(stdout);
	  console.log(servername);
    }

  });
}

/*
config.json file looks like this:

{
  "username": "yourUserNameHere",
  "servers": [
    "server1",
    "server2",
    "etc..."
    ]
}    
 */   
