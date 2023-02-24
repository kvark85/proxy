#!/bin/bash
# Use this for your user data (script from top to bottom)
# ssh -i ~/Work/Work_SoftServe/AWS_Certification/EC2Tutorial2.cer ec2-user@ip

# install and configure squid (Linux 2 version)
yum update -y
yum -y install squid
systemctl enable squid
sed -i 's/http_access deny all/http_access allow all/g' /etc/squid/squid.conf
sed -i 's/http_port 3128/http_port 8888/g' /etc/squid/squid.conf
echo 'forwarded_for delete' | tee -a /etc/squid/squid.conf
echo 'via off' | tee -a /etc/squid/squid.conf
systemctl start squid

# install httpd (Linux 2 version)
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Simple static page on the static server</h1>" > /var/www/html/index.html