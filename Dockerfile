# Image Variant
FROM node:16
# working directory
WORKDIR /app
# copy package.json file to the docker's working directory
COPY package.json .
# after coping the package.json file to the docker's working directory, run install command to download the dependencies.
RUN npm install
# copy all the source code to the working directory
COPY . ./
# set environment variable
# ENV PORT 3000
# expose the container to port 3000
EXPOSE $PORT
# start server
# raw command
#CMD [ "node", "server.js"]
# scripted command
# CMD [ "npm", "run", "start"]
CMD [ "npm", "run", "dev"]