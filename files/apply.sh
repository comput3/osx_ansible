#!/bin/sh
ansible-playbook -i "localhost," -c local osx_ansible.yml --ask-become-pass
