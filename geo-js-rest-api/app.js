const express = require('express');
const geoip = require('geoip-lite');

const app = express();

// endpoint to get country information for a given IP address
app.get('/ip/:address', (req, res) => {
  // get IP address from request parameters
  const ip = req.params.address;

  // look up country information using the GeoIP module
  const country = geoip.lookup(ip);

  // return country information as JSON
  res.json(country);
});

// start the API server
const port = 3000;
app.listen(port, () => {
  console.log(`API server listening on port ${port}`);
});
