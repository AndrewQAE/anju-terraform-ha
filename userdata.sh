#!/bin/bash

# get admin privileges
sudo su

# install httpd (Linux 2 version)
yum update -y
yum install -y httpd
systemctl start httpd.service
systemctl enable httpd.service
cd /var/www/html
aws s3 cp s3://andrew-s3-bucket-ha/index.html .
