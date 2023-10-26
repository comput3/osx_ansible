#!/bin/sh
xcode-select --install
sudo xcodebuild -license
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
sudo pip3 install --ignore-installed ansible
ansible-galaxy install -r requirements.yml

ansible-playbook -i "localhost," -c local playbooks/osx_ansible.yml --ask-become-pass
