#!/bin/bash
#this is third change
# script for setting up server

echo "-> Installing virtualenv..."
sudo apt-get install virtualenv

# Virtual venv name
VIRTUAL_VENV_NAME=${2};

# Python version to use
PYTHON_VERSION=${1}

# set default python version for venv
if [[ -z "$PYTHON_VERSION" ]]
then 
    PYTHON_VERSION=python2.7
fi

if [ -z "$VIRTUAL_VENV_NAME" ]
then
   echo "=> Please pass virtual environment name as a script param e.g. testvenv" 
   exit
else
 echo "-> Creating virtual environment.."
 echo "-> VIRTUAL ENVIRONMENT NAME: $VIRTUAL_VENV_NAME"
 echo "->           PYTHON VERSION: $PYTHON_VERSION"
fi

# create venv
virtualenv --python=$PYTHON_VERSION "$VIRTUAL_VENV_NAME"

source $VIRTUAL_VENV_NAME/bin/activate
pip install -r requirements.txt
python app.py 
