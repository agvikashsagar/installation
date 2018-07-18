#Step 1: System update
#First, let's make sure we're running on a clean system. Update all packages.

yum update
#Then, install the Docker CE dependencies.

yum install -y yum-utils device-mapper-persistent-data lvm2

#Step 2: Installing Docker CE
#Docker provides a repository where you can fetch the stable Docker CE version. Install it with this command:

yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
#To install Docker, simply run:

yum install -y docker-ce
#Optional: In case you want to use the latest version of Docker CE, you have to enable those repositories which are disabled by default:

yum-config-manager --enable docker-ce-edge
yum-config-manager --enable docker-ce-test
#Step 3: Allow Docker commands without sudo
#Launching a container requires administrator privileges. If you don't want to run Docker as the root user, you can run it from your account using sudo. Adding "sudo" in front of each Docker command is tedious - to avoid this, add your user to the "docker" group:

usermod -aG docker your_username
#Now, start the Docker service:

systemctl start docker
#Step 4: Test Docker
#You can use the handy "hello-world" test to verify whether or not Docker will run on your system.

    docker run hello-world
#Upon success, this will return the welcome message:

#Hello from Docker!
#This message shows that your installation appears to be working correctly.

#To generate this message, Docker took the following steps:
#1. The Docker client contacted the Docker daemon.
#2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
#3. The Docker daemon created a new container from that image which runs the
#executable that produces the output you are currently reading.
#4. The Docker daemon streamed that output to the Docker client, which sent it
#to your terminal.

#You can also run an Ubuntu container with:

    docker run -it ubuntu bash
#Let's enable Docker to run when your system boots.

    systemctl enable docker
