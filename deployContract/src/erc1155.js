require('dotenv').config({ path: '../demo.env' })
const Web3 = require("web3");
let web3 = new Web3(
    // Replace YOUR-PROJECT-ID with a Project ID from your Infura Dashboard
    // In test, we use RINKYBY testnet
    new Web3.providers.WebsocketProvider(process.env.ENDPOINT)
  );

function main(){

}