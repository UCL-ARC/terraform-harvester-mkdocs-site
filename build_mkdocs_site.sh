#!/bin/bash -ex

# Install and update packages

dnf update -y
dnf install -y vim git python3-pip httpd

# Set up mkdocs

python -m venv /root/mkdocs
source /root/mkdocs/bin/activate
python -m pip install --upgrade pip

# Build the site

git clone --depth 1 ${mkdocs_repo_url} -b ${mkdocs_repo_branch} /root/mkdocs-source
cd /root/mkdocs-source
python -m pip install -r requirements.txt
mkdocs build

# Serve the site

cp -r site/* /var/www/html/
systemctl enable --now httpd
