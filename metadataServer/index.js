
const express = require("express");
const app = express();
var port = process.env.EXPOSE_PORT
if(port == 80){
    //aws app runner
    app.use(express.static('metadataServer/public'));
}else if(port == 8080){
    //docker
    app.use(express.static('public'));
}else{
    port = 8080;
    app.use(express.static('public'));

}

app.listen(port, () => console.log('Node server listening on port '+port+'!'));
