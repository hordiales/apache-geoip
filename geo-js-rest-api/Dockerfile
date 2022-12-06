FROM node:14-alpine

# create working directory
WORKDIR /app

# copy source code
COPY app.js /app

# install dependencies
RUN npm install express geoip-lite

# expose API port
EXPOSE 3000

# run API server
CMD ["node", "app.js"]