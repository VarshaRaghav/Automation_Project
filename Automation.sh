myname="Varsha"
s3_bucket="upgrad-varshad"
timestamp=$(date '+%d%m%Y-%H%M%S')
pathname=/tmp/
logname=${myname}-httpd-logs-${timestamp}.tar
size=$(du -h ${file} | awk '{print $1}')
sitepath="/var/www/html"
cronpath=/etc/cron.d/Automation
file=${pathname}${logname}
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


if test -f "${sitepath}/inventory.html"; then
    echo "inventory exists";
else
    echo "creating inventory";
    echo -e 'Log Type\t-\tTime Created\t-\tType\t-\tSize' > ${sitepath}/inventory.html
fi

if test -f "${sitepath}/inventory.html"; then
    echo "updating inventory";
    size=$(du -h ${file} | awk '{print $1}')
        echo -e "/tmp/${name}-httpd-logs\t-\t${timestamp}\t-\ttar\t-\t${size}" >> ${sitepath}/inventory.html
fi

if test -f ${cronpath}; then
    echo "cron job exists";
else
echo "     * root/Automation_Project/automation.sh" >> ${cronpath}
fi
