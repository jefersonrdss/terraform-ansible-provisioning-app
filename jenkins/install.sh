# Update and Upgrade Packages
sudo apt update
sudo apt upgrade -y

# Install Java 11
sudo apt install openjdk-11-jdk -y

# Install Jenkins LTS
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins

# Show Initial Admin Password
ssh user@host "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"