# Use the node 10 image
FROM node:10

# Create app directory
WORKDIR /app

# Install Iconic
RUN npm install -g ionic

# Install app dependencies
COPY *.json ./

# -f used in case of https://github.com/angular/angular/issues/13935
RUN npm install -f
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

# Run the Server
# CMD [ "node", "dist/server.js" ]
# CMD [ "ts-node", "lib/server.ts" ]
CMD ionic serve --address=0.0.0.0

# Port from our Application
EXPOSE 8100
