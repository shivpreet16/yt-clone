const express = require('express');
const dotenv = require('dotenv');
const WebHDFS = require('webhdfs');
const app = express();
dotenv.config();

app.get('/', (req, res) => {res.send('Hello World!')})

const client = WebHDFS.createClient({
    host: 'localhost',
    port: '9000',
  });
  
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log('Server running on port ' + PORT));