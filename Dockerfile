  
FROM alpine:latest
RUN apk update && apk add git openjdk11-jre maven
WORKDIR /home/user/build