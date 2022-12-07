myname="Varsha"
s3_bucket="upgrad-varshad"
timestamp=$(date '+%d%m%Y-%H%M%S')
sudo apt update -y
sudo apt install apache2
sudo ufw app list
sudo ufw allow 'Apache'
cp -r /var/log/apache2/ /tmp/${myname}-httpd-logs-${timestamp}.tar
sudo apt update
sudo apt install awscli
aws configure
Default output format [None]:
aws s3 cp --recursive /tmp/${myname}-httpd-logs-${timestamp}.tar s3://${s3_bucket}/${myname}-httpd-logs-${timestamp}.tar