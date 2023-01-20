# DockerFile is the instruction file to tell how we want docker make the image from this nodejs app


# define the base image which in this case is nodejs
FROM node:16


# Create app directory 
WORKDIR /usr/src/app


# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

#install the dependencies in package.json
RUN npm install

# tell docker to Bundle app source and copy it to image
COPY . .

# Because we listen on port 8080 so we register the container to port 8080
EXPOSE 8080

# when the container is running we can use these cmd in CLI
CMD [ "node", "server.js" ]