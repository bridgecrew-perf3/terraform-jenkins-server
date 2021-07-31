# echo "START" >> /tmp/status.txt
# sudo chmod 777 /tmp/status.txt
# # config jenkins installer on ubuntu
# sudo add-apt-repository ppa:webupd8team/java -y
# wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

# # config java8 installer on ubuntu
# sudo sh -c 'echo "deb https://pkg.jenkins.io/debian binary/" >> /etc/apt/sources.list'
# echo debconf shared/accepted-oracle-license-v1-1 select true | \
# sudo debconf-set-selections
# echo debconf shared/accepted-oracle-license-v1-1 seen true | \
# sudo debconf-set-selections

# echo "CONFIG DONE" >> /tmp/status.txt 
# sudo apt-get update  >> /tmp/status.txt

# # apt-get install java and jenkins
# sudo apt-get -y install oracle-java8-installer  >> /tmp/status.txt
# sudo apt-get -y install jenkins  >> /tmp/status.txt

# echo "APT-GET INSTALL DONE" >> /tmp/status.txt

# # wait for jenkins start up
# response=""
# key=""
# while [ `echo $response | grep 'Authenticated' | wc -l` = 0 ]; do
#   key=`sudo cat /var/lib/jenkins/secrets/initialAdminPassword`
#   echo $key >> /tmp/status.txt
#   response=`sudo java -jar /var/cache/jenkins/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080 who-am-i --username admin --password $key`
#   sudo echo $response
#   sudo echo "Jenkins not started, wait for 2s"
#   sleep 2
# done >> /tmp/status.txt
# echo "Jenkins started" >> /tmp/status.txt
# echo "Install Plugins" >> /tmp/status.txt

# # install plugins with jenkins-cli
# for package in ant blueocean blueocean-autofavorite build-timeout email-ext ghprb gradle jacoco workflow-aggregator pipeline-github-lib sbt ssh-slaves subversion timestamper ws-cleanup; do sudo sh -c "sudo java -jar /var/cache/jenkins/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080 install-plugin $package --username admin --password $key >> /tmp/status.txt"; done;  

# echo "PLUGINS INSTALL DONE" >> /tmp/status.txt

# # restart jenkins
# /etc/init.d/jenkins restart  >> /tmp/status.txt

# echo "ALL DONE" >> /tmp/status.txt

## Install java
sudo apt update && sudo apt install openjdk-8-jdk -y

## Install Jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'

sudo apt-get update && sudo apt-get install jenkins -y
sudo systemctl start jenkins >> /tmp/status.txt
sudo ufw allow 8080/tcp
sudo ufw reload

sudo apt install git 
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt install terraform=0.14.0

git clone https://github.com/raghebbenhamouda/gke.git
sudo cp credentials.json ~/gke/
cd gke/
terraform init
terraform apply --auto-approve



# # wait for jenkins start up
# response=""
# key=""
# ip=""
# ip=`curl https://ipinfo.io/ip`
# `
# while [ `echo $response | grep 'Authenticated' | wc -l` = 0 ]; do
#   key=`sudo cat /var/lib/jenkins/secrets/initialAdminPassword`
#   echo $key >> /tmp/status.txt
#   response=`sudo java -jar /var/cache/jenkins/war/WEB-INF/jenkins-cli.jar -s http://$ip:8080 who-am-i --username admin --password $key`
#   sudo echo $response
#   sudo echo "Jenkins not started, wait for 2s"
#   sleep 2
# done >> /tmp/status.txt
# echo "Jenkins started" >> /tmp/status.txt
# echo "Install Plugins" >> /tmp/status.txt
# # install plugins with jenkins-cli
# for package in ant blueocean blueocean-autofavorite build-timeout email-ext ghprb gradle jacoco workflow-aggregator pipeline-github-lib sbt ssh-slaves subversion timestamper ws-cleanup; do sudo sh -c "sudo java -jar /var/cache/jenkins/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080 install-plugin $package --username admin --password $key >> /tmp/status.txt"; done;  

# echo "PLUGINS INSTALL DONE" >> /tmp/status.txt

# # restart jenkins
# /etc/init.d/jenkins restart  >> /tmp/status.txt

# echo "ALL DONE" >> /tmp/status.txt
# sudo systemctl start jenkins >> /tmp/status.txt
