## Project X

This project is used to run a webapp using tomcat server.

## Prerequisites/tools needed to work on this project. 
 
- [tomcat image]([https://github.com/awsdocs/amazon-ec2-user-guide/blob/master/doc_source/EC2_GetStarted.md](https://hub.docker.com/_/tomcat))
- [dockerHUB](https://www.docker.com/products/docker-hub/)
- [Docker](https://docs.docker.com/get-started/overview/)
- [Jenkins](https://www.jenkins.io/doc/tutorials/)
- [Kubernetes](https://github.com/Krishnamohan-Yerrabilli/Kubernetes-hands-on)
- [Jenkins](https://www.jenkins.io/doc/tutorials/)

We will have a deployment over a `Kubernetes cluster` using `Jenkins CI/CD pipeline`,  <br>
in this project, we are taking the help of various DevOps tools like GitHub, Jenkins, <br>
dockerHUB and a `Kubernetes cluster(2 nodes)`.

We will also learn about Kubernetes to know about this deployment and services and we  <br>
will write Dockerfile, pom.xml. Jenkinsfile, manifest.yml ect to execute the jenkins job.

## Agenda 

 - When the developer writes a Docker file, he pushes it to the `GitHub repository`  <br>
   so whenever there is a new commit to the GitHub repo When the new code arrives it  <br>
   Notifies Jenkins via a webhook, and Jenkins starts the pipeline.

 - Jenkins pulls all the code from the GitHub repository Once it's completed, it will <br>
  ssh to the ansible server so when a developer `pushes` a docker file it accesses the  <br>
  Ansible server and starts running the image.

 - When it gets the docker file it starts building the image based on the docker file It  <br>
  tags it, and once `tagged` it pushes to the Docker hub and the second task of the Ansible  <br>
  Server is, it will ssh to our Kubernetes cluster server, which will evaluate and ansible  <br>
  will execute the playbook.

 - It runs the `kubectl` command on our Kubernetes cluster(web app) and it tries to get the  <br>
  latest image from the docker registry .It will pull from the docker hub and it will start <br>
  building the image, it will build a container and that container should be available to <br>
  us using an `node IP` and a `port` which we specified in the `Service.yaml`

 - We're going to start by writing `Service.yaml` and hand it over to the Kubernetes cluster <br>
  So this is the whole scenario in simple terms was going to achieve a `Kubernetes deployment`

 - The Jenkins CI/CD pipeline uses various tools We use `Linux` commands, Jenkins, and Docker <br>
   and you need to have a `Dockerhub account`, so once `Ansible Server` builds a Docker image <br>
   based on the Docker file, we push it to the Docker Hub.

 - So we need to log in to Docker Hub here so we can easily push the latest image so what  <br>
   we're trying to accomplish here is we have the latest image and we also maintain a <br>
   version based on the build

 - It builds v1, it contains a fresh image, If the second time it builds another image v2 <br>
 so that the second contains the latest image, we are `performing a version`, also, we have <br>
 to separate the `latest image`.

## Workflow

![Work Flow](webapp.drawio.png)

##Project Outputs

## 1. Jenkins Workflow Status

![Jenkins Steps](Jenkins_Workflow.png)

## 2. Hosted at Localhost/8080

![Jenkins Steps](webpage.png)
