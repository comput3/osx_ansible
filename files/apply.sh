#!/bin/sh
ansible-playbook -i "localhost," -c local playbooks/osx_ansible.yml --ask-become-pass
