#base image
FROM node:latest

# set env app name from docker compose
ARG APP_NAME

# set working directory
RUN mkdir /usr/src/app

#copy all files from current directory to docker
ADD ${APP_NAME} /usr/src/app

WORKDIR /usr/src/app

# install and cache app dependencies
RUN yarn

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# start app
# CMD npm start --host 0.0.0.0 --port 3000 --disableHostCheck true
CMD ["npm", "start"]