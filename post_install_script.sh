#!/bin/bash

GENXCOMMINC_CONTROL_PROXY_PATH="/root/configs/control_proxy.yml"
GENXCOMMINC_CA_PEM_FILE_PATH="/root/certs/rootCA.pem"

CONTROL_PROXY_FILE_PATH="/var/opt/magma/configs/control_proxy.yml"
ROOT_CA_PEM_FILE_PATH="/var/opt/magma/tmp/certs/rootCA.pem"

mkdir -p /var/opt/magma/tmp/certs/
mkdir -p /var/opt/magma/configs/

if [ -f "$GENXCOMMINC_CONTROL_PROXY_PATH" ] && [ -f "$GENXCOMMINC_CA_PEM_FILE_PATH" ]; then
	cp -rf $GENXCOMMINC_CONTROL_PROXY_PATH $CONTROL_PROXY_FILE_PATH
	cp -rf $GENXCOMMINC_CA_PEM_FILE_PATH $ROOT_CA_PEM_FILE_PATH
fi


while true; do
    read -p "Do you want to contiue with post installation ?" yn
    case $yn in
        [Yy]* ) echo "Running Post Installation Script"; /bin/bash /root/agw_post_install_ubuntu.sh;break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
