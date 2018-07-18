#Step 1: Update your CentOS 7 system
#One of the Linux system administrator's best practices is keeping a system up to date. Install the latest stable packages, then reboot.

sudo yum install epel-release
sudo yum update
#sudo reboot
#Step 2: Install Java
#Before you can install Jenkins, you need to setup a Java virtual machine on your system. Here, let's install the latest OpenJDK Runtime Environment 1.8.0 using YUM:

sudo yum install java-1.8.0-openjdk.x86_64
#After the installation, you can confirm it by running the following command:

java -version
#This command will tell you about the Java runtime environment that you have installed:

#openjdk version "1.8.0_91"
#OpenJDK Runtime Environment (build 1.8.0_91-b14)
#OpenJDK 64-Bit Server VM (build 25.91-b14, mixed mode)

#In order to help Java-based applications locate the Java virtual machine properly, you need to set two environment variables: "JAVA_HOME" and "JRE_HOME".

sudo cp /etc/profile /etc/profile_backup
echo 'export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk' | sudo tee -a /etc/profile
echo 'export JRE_HOME=/usr/lib/jvm/jre' | sudo tee -a /etc/profile
source /etc/profile
#Finally, you can print them for review:

echo $JAVA_HOME
echo $JRE_HOME

#Step 3: Install Jenkins
#Use the official YUM repo to install the latest stable version of Jenkins, which is 1.651.2 at the time of writing:

cd ~ 
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install jenkins
#Start the Jenkins service and set it to run at boot time:

sudo systemctl start jenkins.service
sudo systemctl enable jenkins.service
#In order to allow visitors access to Jenkins, you need to allow inbound traffic on port 8080:

sudo firewall-cmd --zone=public --permanent --add-port=8080/tcp
sudo firewall-cmd --reload
#Now, test Jenkins by visiting the following address from your web browser:

#http://<your-server-IP>:8080
