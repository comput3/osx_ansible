#!/bin/sh
ansible-playbook -i "localhost," -c local playbooks/configure.yml --ask-become-pass
