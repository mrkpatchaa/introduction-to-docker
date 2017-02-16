FROM node:latest

# Install useful stuff
RUN apt-get update \
&& apt-get install -y curl vim \
&& rm -rf /var/lib/apt/lists/*

# Prepare app directory
RUN mkdir -p /usr/src/app

# Install dependencies
ADD package.json /usr/src/app/
WORKDIR /usr/src/app
RUN npm install

# Copy project files
ADD . /usr/src/app

# Build the app
RUN npm build

# Expose the app port and the volume to share
EXPOSE 3000
VOLUME /usr/src/app/log

# Start the app
CMD node server.js

