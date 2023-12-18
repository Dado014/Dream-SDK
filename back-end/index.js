const express = require('express');
const app = express();
const PORT = 443

const KV_URL = process.env.KV_URL
const KV_REST_API_URL = process.env.KV_REST_API_URL
const KV_REST_API_TOKEN = process.env.KV_REST_API_TOKEN
const KV_REST_API_READ_ONLY_TOKEN = process.env.KV_REST_API_READ_ONLY_TOKEN

app.get('/', (req, res) => {
    res.send('Hello, World!');
  });
  
  app.listen(PORT, () => {
    console.log(`Server listening to port ${PORT}`);
  });
  
