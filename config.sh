#!/bin/bash

error_exit() {
    echo "$1" 1>&2
    exit 1
}

echo "updating packages..."
sudo apt update

echo "upgrading packages..."
sudo apt upgrade -y 

echo "Installing python, pip, and virtualenv..."
sudo apt install python3 python3-pip python3-venv || error_exit

echo "Creating the virtual environment..."
python3 -m venv my_env || error_exit

echo "Activating the virtual environment..."
source my_env/bin/activate || error_exit

echo "Installing django..."
pip install django 

echo "Creating django project..."
django-admin startproject myproject

cd myproject

echo "Making migrations..."
python3 manage.py makemigrations

echo "Migrating..."
python3 manage.py migrate

echo "Creating superuser..."
python3 manage.py createsuperuser