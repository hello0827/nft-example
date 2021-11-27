const express = require("express");
const app = express();

app.use(express.static('public'));


app.listen(process.env.EXPOSE_PORT, () => console.log('Node server listening on port '+process.env.EXPOSE_PORT+'!'));