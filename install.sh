#!/bin/bash
echo "Installing git ..." >> /tmp/sample_install.txt
yum update -y
yum install git -y
echo "Git successfully installed!" >> /tmp/sample_install.txt