# Build 
 docker build -t geoip-api .
 docker run --name geoip-api -p 3000:3000 -d geoip-api

# Example

http://localhost:3000/ip/8.8.8.8
{"range":[134742016,134774783],"country":"US","region":"","eu":"0","timezone":"America/Chicago","city":"","ll":[37.751,-97.822],"metro":0,"area":1000}


http://localhost:3000/ip/181.29.43.222
{"range":[3038586880,3038588927],"country":"AR","region":"C","eu":"0","timezone":"America/Argentina/Buenos_Aires","city":"Buenos Aires","ll":[-34.6021,-58.3845],"metro":0,"area":5}