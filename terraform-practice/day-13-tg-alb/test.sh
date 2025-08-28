#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
echo "Hello from suhrud steve" > /var/www/html/index.html
sudo systemctl start httpd
sudo systemctl enable httpd
