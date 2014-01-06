from fabric.api import *
from fabric.contrib.project import rsync_project

def apply():
    rsync_project(remote_dir='/usr/local/puppet', local_dir='.', extra_opts='--delete')
    sudo('puppet apply --modulepath /usr/local/puppet/modules /usr/local/puppet/manifests/site.pp')

def setup_client():
    sudo('sed -i "s/mirrors.digitalocean/archive\.ubuntu/g" /etc/apt/sources.list')
    #sudo('sudo sed -i "s/archive\.ubuntu/mirrors.digitalocean/g" /etc/apt/sources.list')
    sudo('apt-get update')
    sudo('apt-get install -y puppet')
    sudo('mkdir -p /usr/local/puppet')
    sudo('chown -R root /usr/local/puppet')
