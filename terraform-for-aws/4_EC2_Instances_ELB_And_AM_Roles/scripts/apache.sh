#!/bin/bash
yum install httpd -y

systelctl start httpd
systelctlenavle http

echo "<h1> Java Home App</h1>" > /var/www/html/index.html