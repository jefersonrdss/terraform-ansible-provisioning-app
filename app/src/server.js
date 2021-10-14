const express = require("express");

const server = express();

server.get("/", (request, response) => {

    response.status(200).send("<h3>OK! Server is running.</h3>");
});

server.listen(80, () => console.log("Server is running on port 80"));