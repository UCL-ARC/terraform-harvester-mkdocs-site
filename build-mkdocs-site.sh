#!/bin/bash -e

# Install and update packages

dnf update -y
dnf install -y vim git python3-pip # httpd

# Set up mkdocs

python -m venv mkdocs
source /root/mkdocs/bin/activate
pip install -y mkdocs

# mkdocs plugins, if any, need to be installed here

git clone https://github.com/UCL-ARC/mkdocs-demo.git mkdocs-source
cd mkdocs-source
mkdocs build

# Serve the site

## Replace this with httpd or whatever web server solution
## static site files are at /root/<repo name>/site
mkdocs serve
