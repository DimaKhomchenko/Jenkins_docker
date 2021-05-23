FROM docker:20
RUN apk update && apk add git openjdk11-jre maven
WORKDIR /home/user/build
COPY ./deploy/Dockerfile /home/user/deploy/Dockerfile
RUN mkdir /root/.ssh
RUN chmod 600 /root/.ssh/id_rsa