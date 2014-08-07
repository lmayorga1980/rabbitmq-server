# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

 config.vm.define :ubuntu do |ubuntu|

    #https://github.com/mitchellh/vagrant/issues/1673#issuecomment-28288042
    ubuntu.ssh.shell =  "bash -c 'BASH_ENV=/etc/profile exec bash'"

    ubuntu.vm.box      = 'lmayorga1980/ubuntu-trusty'
    ubuntu.vm.hostname = 'rabbitmqserver'
    ubuntu.vm.network   :private_network, ip: '10.11.0.100'
    ubuntu.vm.provision :shell, path: 'scripts/initial-setup.sh'

    ubuntu.vm.provision :puppet do |puppet|
      puppet.manifests_path = 'manifests'
      puppet.manifest_file  = 'site.pp'
      puppet.module_path    = 'modules'
      puppet.options = '--verbose'
    end  

    #ubuntu.vm.provision :shell, path: 'scripts/post-puppet-provisioning.sh'

    ubuntu.vm.provider :virtualbox do |v|
      v.gui = true
    end
  end 
end
