# Project-X
This project is used to run a webapp using tomcat server.

The workflow involves:-
1. Triggering with a webhook or Jenkins manual build option
2. Using Maven, Jenkins Job will clean and package the application using git as SCM scource
3. After packaging using Maven, Jenkins will start the creating image using Dockerfile in the SCM
4. Created docker images is pushed into DockerHub
5. USing the latest image avaliable in DOckerHub, docker cotainer is hosted in the port 8080.

