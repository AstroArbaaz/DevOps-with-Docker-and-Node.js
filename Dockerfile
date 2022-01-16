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
# expose the container to port 3000
EXPOSE 3000
# start server
CMD [ "node", "server.js"]