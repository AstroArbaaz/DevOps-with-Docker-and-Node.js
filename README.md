# DevOps-with-Docker-and-Node.js
DevOps with Docker and Node.js/Express: Development to production workflow + mongo + redis

## Instructions to create a docker image for node application

Create a "Dockerfile" in your project directory

Enter this instructions into "Dockerfile"

```bash
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
# raw command
#CMD [ "node", "server.js"]
# scripted command
# CMD [ "npm", "run", "start"]
CMD [ "npm", "run", "dev"]
```

create a ".dockerignore" file to ignore the files which are not needed when you build the docker image.

Enter this file and directory names into ".dockerignore" file

```bash
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

To Syncronize source code with read-only bind mode.

```bash
docker run -v <path-to-local-project-directory>:<path-to-docker-work-directory>:ro -v /app/node_modules -p <container-port>:<image-port> -d --name <give-a-name-to-the-container> <name-of-the-image>
```

- its a read-only bind mount that means any changes inside container will not affect the project repository in your local machine or main project file
- "-v /app/node_modules" this will prevent the node_modules in the container to be untouched

example :

```bash
docker run -v %cd%:/app:ro -v /app/node_modules -p 3000:3000 -d --name node-application node-image
```

- use "%cd%" a shortcut to mention the current directory in windows CMD
- use ${pwd} a shortcut to mention the current directory in windows powershell
- use $(pwd) a shortcut to mention the current directory in windows linux and Mac

To view the running Docker Containers

```bash
docker ps
```

or 

```bash
docker ps -a
```

to see all the container which are running or not running

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