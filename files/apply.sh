#!/bin/sh

: '
Description:
    This script checks for and installs necessary dependencies such as
    Xcode Command Line Tools, Rosetta, pip3, and Ansible. It then runs
    an Ansible playbook to configure a macOS system.
'

# Check if Xcode Command Line Tools are installed
if ! xcode-select -p &>/dev/null; then
    xcode-select --install
    if [ $? -eq 0 ]; then
        echo "Xcode Command Line Tools installed."
        # Accept Xcode license since we've just installed Xcode
        sudo xcodebuild -license accept
    else
        echo "Error installing Xcode Command Line Tools."
    fi
else
    echo "Xcode Command Line Tools already installed."
fi

# Install Rosetta if not installed
if ! arch -x86_64 /usr/bin/true &>/dev/null; then
    /usr/sbin/softwareupdate --install-rosetta --agree-to-license
    if [ $? -eq 0 ]; then
        echo "Rosetta installed."
    else
        echo "Error installing Rosetta."
    fi
else
    echo "Rosetta already installed."
fi

# Install pip for Python3
if ! command -v pip3 &>/dev/null; then
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python3 get-pip.py
    rm get-pip.py
    if [ $? -eq 0 ]; then
        echo "pip3 installed."
    else
        echo "Error installing pip3."
    fi
else
    echo "pip3 already installed."
fi

# Install Ansible
if ! command -v ansible &>/dev/null; then
    sudo pip3 install --ignore-installed ansible
    if [ $? -eq 0 ]; then
        echo "Ansible installed."
    else
        echo "Error installing Ansible."
    fi
else
    echo "Ansible already installed."
fi

# Execute Ansible playbook
ansible-playbook -i "localhost," -c local playbooks/configure.yml --ask-become-pass
