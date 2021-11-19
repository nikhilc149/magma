#!/bin/bash

systemctl stop agw
systemctl disable agw
systemctl mask agw
systemctl daemon-reload
touch /root/temp.txt