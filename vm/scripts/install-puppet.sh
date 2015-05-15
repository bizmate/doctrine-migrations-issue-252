#!/bin/bash
if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

if which puppet > /dev/null 2>&1; then
  echo "Puppet is already installed"
  exit 0
fi

# Install puppet labs repo
echo "Configuring PuppetLabs repo..."
rpm -ivh "http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm" >/dev/null

# Install Puppet...
echo "Installing puppet"
yum install -y puppet > /dev/null

echo "Puppet installed!"