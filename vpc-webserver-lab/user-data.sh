#!/bin/bash
# Instalação do Apache, MySQL e PHP
yum install -y httpd mysql php
# Download dos arquivos da aplicação
wget https://aws-tc-largeobjects.s3.us-west-2.amazonaws.com/CUR-TF-100-RESTRT-1/267-lab-NF-build-vpc-web-server/s3/lab-app.zip
unzip lab-app.zip -d /var/www/html/
# Inicialização do serviço
chkconfig httpd on
service httpd start
