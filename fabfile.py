from fabric.api import *
from fabric.contrib.project import rsync_project

from hierapy import HieraPy
config = HieraPy('./hiera.yaml', './hieradata')
#print config.get('ssh/user')

#
# Task: apply
#
# Apply the current puppet configuration to the target host
#
def apply():
    rsync_project(remote_dir='/usr/local/puppet', local_dir='.', extra_opts='--delete')
    sudo('puppet apply --modulepath /usr/local/puppet/modules /usr/local/puppet/manifests/site.pp')

#
# Task: setup
#
# Remotely configure the host in preparation for the "apply" task
#
def setup():
    update_puppetlabs()
    force_ubuntu_repos()
    install_puppet()
    install_ruby_additions()

#
# Helper methods
#
def update_puppetlabs():
    sudo('wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb -P /var/tmp')
    sudo('dpkg -i /var/tmp/puppetlabs-release-precise.deb')
    sudo('rm /var/tmp/puppetlabs-release-precise.deb*')

def force_ubuntu_repos():
    """
    DigitalOcean's mirrors seem to be updated, no need for overrides then
    """
    # sudo('sed -i "s/mirrors.digitalocean/archive\.ubuntu/g" /etc/apt/sources.list')
    # sudo('sudo sed -i "s/archive\.ubuntu/mirrors.digitalocean/g" /etc/apt/sources.list')
    sudo('apt-get update')

def install_puppet():
    sudo('apt-get install -y puppet-common')
    sudo('mkdir -p /usr/local/puppet')
    sudo('chown -R root /usr/local/puppet')

def install_ruby_additions():
    sudo('apt-get install -y rubygems')
    sudo('gem install deep_merge')
