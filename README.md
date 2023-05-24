# Project X

This project is used to run a webapp using tomcat server.

Workflow

1. Triggering with a webhook or Jenkins manual build option
2. Using Maven, Jenkins Job will clean and package the application using git as SCM scource
3. After packaging using Maven, Jenkins will start the creating image using Dockerfile in the SCM
4. Created docker images is pushed into DockerHub
5. USing the latest image avaliable in DockerHub, docker cotainer is hosted in the port 8080.

![Work Flow]([https://example.com/image.png](https://drive.google.com/file/d/1y8P1Mm5qUH9832IF17PihA3F2QTqBAFj/view?usp=sharing))


