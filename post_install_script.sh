#!/bin/bash

CONTROL_PROXY_FILE_PATH="/var/opt/magma/configs/control_proxy.yml"

create_control_proxy_yml_file()
{
    > $CONTROL_PROXY_FILE_PATH
    echo "Creating control_proxy.yml file"
    echo "
local_port: $local_port
cloud_address: $cloud_address
cloud_port: $cloud_port

bootstrap_address: $bootstrap_address
bootstrap_port: $bootstrap_port

fluentd_address: $fluentd_address
fluentd_port: $fluentd_port

rootca_cert: /var/opt/magma/tmp/certs/rootCA.pem
gateway_cert: /var/opt/magma/certs/gateway.crt
gateway_key: /var/opt/magma/certs/gateway.key" >> $CONTROL_PROXY_FILE_PATH 

}


echo "Configuring control_proxy.yml file"
echo ""
echo "Please make sure you copied rootCA.pem, gateway.crt and gateway.key at below location"
echo "rootca_cert: /var/opt/magma/tmp/certs/rootCA.pem"
echo "gateway_cert: /var/opt/magma/certs/gateway.crt"
echo "gateway_key: /var/opt/magma/certs/gateway.key"
echo ""

echo "Enter local port"
read local_port

echo "Enter cloud address"
read cloud_address

echo "Enter cloud port"
read cloud_port

echo "Enter bootstrap address"
read bootstrap_address

echo "Enter bootstrap port"
read bootstrap_port

echo "Enter fluentd address"
read fluentd_address

echo "Enter fluentd port"
read fluentd_port

while true; do
    read -p "Do you want to contiue with post installation ?" yn
    case $yn in
        [Yy]* ) create_control_proxy_yml_file; echo "Running Post Installation Script"; /bin/bash /root/agw_post_install_ubuntu.sh;break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
