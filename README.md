# DevOps-with-Docker-and-Node.js
DevOps with Docker and Node.js/Express: Development to production workflow + mongo + redis

## Instructions to create a docker image for node application

Create a "Dockerfile" in your project directory

Enter this instructions into "Dockerfile"

```
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
```

create a ".dockerignore" file to ignore the files which are not needed when you build the docker image.

Enter this file and directory names into ".dockerignore" file

```
.git
.gitignore
.dockerignore
package-lock.json
node_modules
Dockerfile
```

## To Build the Docker Image

Stop the local server if it is on and run this command in your terminal:

```bash
docker build -t <give-a-name-to-the-image> <path-to-the-Dockerfile>
```

- note: "-t" means tag, it is used to give a name to an image  

example :

```bash
docker build -t node-application-image .
```

I have used period in the command because the path to the "Dockerfile" is in the current directory

To view the list of Available Docker Images

```bash
docker image ls
```

## To Run the Docker Container

After the build image build is complete, you can now start the docker container to run the image.

Run this command to start the container:

```bash
docker run -p <container-port>:<image-port> -d --name <give-a-name-to-the-container> <name-of-the-image>
```

example :

```bash
docker run -p 3000:3000 -d --name node-application node-image
```

- "-p" will allow external world to access the application
- "-d" means the container will run in detched mode
- "--name" is used to name the container

To view the running Docker Containers

```bash
docker ps
```

To kill a running and delete running container

```bash
docker rm <container-name> -f
```

- "-f" means Forcefull

To view files in a docker container

```bash
docker exec -it <container-name> bash
```

- "-it" means interactive mode"