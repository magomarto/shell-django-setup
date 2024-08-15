#!/bin/bash

error_exit() {
    echo "$1" 1>&2
    exit 1
}

echo "#### updating the system... ####"
sudo apt update && sudo apt upgrade -y

echo "#### Installing python, pip, and virtualenv... ####"
sudo apt install python3 python3-pip python3-venv || error_exit

echo "#### Creating the virtual environment... ####"
python3 -m venv my_env || error_exit

echo "#### Activating the virtual environment... ####"
source my_env/bin/activate || error_exit

echo "#### Installing django... ####"
pip install django 

echo "#### Creating requirements.txt... ####"
pip freeze > requirements.txt

echo "#### Creating django project... ####"
django-admin startproject myproject
cd myproject

echo "#### Creating django app ####"
python3 manage.py startapp my_app
cd my_app
mkdir templates
mkdir static
cd static
mkdir js
mkdir css
cd ..
cd ..

echo "#### Making migrations... ####"
python3 manage.py makemigrations

echo "#### Migrating... ####"
python3 manage.py migrate

echo "#### Creating superuser... ####"
python3 manage.py createsuperuser


python3 manage.py runserver