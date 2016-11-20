FROM node:alpine

MAINTAINER thisbounty.com

# Install Mean.JS packages
RUN npm install

# Port 3000 for server
# Port 35729 for livereload
# Port 8080 for frontend
EXPOSE 3000 35729 8080
