#!/bin/sh

# Check if Xcode Command Line Tools are installed
if ! xcode-select -p &>/dev/null; then
    xcode-select --install
else
    echo "Xcode Command Line Tools already installed."
fi

# Accept Xcode license
sudo xcodebuild -license accept

# Install Rosetta if not installed
if ! arch -x86_64 /usr/bin/true &>/dev/null; then
    /usr/sbin/softwareupdate --install-rosetta --agree-to-license
else
    echo "Rosetta already installed."
fi

# Install pip for Python3
if ! command -v pip3 &>/dev/null; then
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python3 get-pip.py
    rm get-pip.py
else
    echo "pip3 already installed."
fi

# Install Ansible
if ! command -v ansible &>/dev/null; then
    sudo pip3 install --ignore-installed ansible
else
    echo "Ansible already installed."
fi

# Install Ansible roles from requirements
#ansible-galaxy install -r requirements.yml

# Execute Ansible playbook
ansible-playbook -i "localhost," -c local playbooks/configure.yml --ask-become-pass
