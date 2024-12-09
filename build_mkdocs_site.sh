#!/bin/bash -ex

# Install and update packages

dnf update -y
dnf install -y vim git python3-pip httpd

# Set up mkdocs

python -m venv mkdocs
source /root/mkdocs/bin/activate
python -m pip install --upgrade pip
pip install mkdocs

# mkdocs plugins, if any, need to be installed here

git clone --depth 1 ${mkdocs_repo_url} mkdocs-source
cd mkdocs-source
mkdocs build

# Serve the site

cp -r site/* /var/www/html/
systemctl start httpd