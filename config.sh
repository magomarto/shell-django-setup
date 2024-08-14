#!/bin/bash

echo "updating packages..."
sudo apt update

echo "upgrading packages..."
sudo apt upgrade -y

echo "Installing python, pip, and virtualenv..."
sudo apt install python3 python3-pip python3-venv

echo "Creating the virtual environment..."
python3 -m venv my_env

echo "Activating the virtual environment..."
source my_env/bin/activate

echo "Installing django..."
pip install django 

echo "Creating django project..."
django-admin startproject myproject

cd myproject

echo "Creating superuser..."
python3 manage.py createsuperuser

