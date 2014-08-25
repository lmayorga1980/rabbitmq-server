# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  #rabbitmqserver definition:
  config.vm.define :rbs1 do |rbs1|

    #https://github.com/mitchellh/vagrant/issues/1673#issuecomment-28288042
    rbs1.ssh.shell =  "bash -c 'BASH_ENV=/etc/profile exec bash'"

    rbs1.vm.box      = 'lmayorga1980/ubuntu-trusty'
    rbs1.vm.hostname = 'rabbitmqserver1'
    rbs1.vm.network   :private_network, ip: '10.11.0.100'
    rbs1.vm.provision :shell, path: 'scripts/initial-setup.sh'
    rbs1.vm.provision :shell, path: 'scripts/install-puppet-modules.sh'
    rbs1.vm.provision :shell, inline: 'echo 10.11.0.101 rabbitmqserver2 >> /etc/hosts'
    rbs1.vm.provision :shell, inline: 'echo 10.11.0.102 rabbitmqserver3 >> /etc/hosts'

    rbs1.vm.provision :puppet do |puppet|
      puppet.manifests_path = 'manifests'
      puppet.manifest_file  = 'site.pp'
      puppet.module_path    = 'modules'
      puppet.options = '--verbose'
    end

    #ubuntu.vm.provision :shell, path: 'scripts/post-puppet-provisioning.sh'

    rbs1.vm.provider :virtualbox do |v|
      v.gui = false
      v.memory = 512
      v.cpus   = 2
    end
  end

    #rabbitmqserver definition:
  config.vm.define :rbs2 do |rbs2|

    #https://github.com/mitchellh/vagrant/issues/1673#issuecomment-28288042
    rbs2.ssh.shell =  "bash -c 'BASH_ENV=/etc/profile exec bash'"

    rbs2.vm.box      = 'lmayorga1980/ubuntu-trusty'
    rbs2.vm.hostname = 'rabbitmqserver2'
    rbs2.vm.network   :private_network, ip: '10.11.0.101'
    rbs2.vm.provision :shell, path: 'scripts/initial-setup.sh'
    rbs2.vm.provision :shell, path: 'scripts/install-puppet-modules.sh'
    rbs2.vm.provision :shell, inline: 'echo 10.11.0.100 rabbitmqserver1 >> /etc/hosts'
    rbs2.vm.provision :shell, inline: 'echo 10.11.0.102 rabbitmqserver3 >> /etc/hosts'

    rbs2.vm.provision :puppet do |puppet|
      puppet.manifests_path = 'manifests'
      puppet.manifest_file  = 'site.pp'
      puppet.module_path    = 'modules'
      puppet.options = '--verbose'
    end

    #ubuntu.vm.provision :shell, path: 'scripts/post-puppet-provisioning.sh'

    rbs2.vm.provider :virtualbox do |v|
      v.gui = false
      v.memory = 512
      v.cpus   = 2
    end
 end

     #rabbitmqserver definition:
  config.vm.define :rbs3 do |rbs3|

    #https://github.com/mitchellh/vagrant/issues/1673#issuecomment-28288042
    rbs3.ssh.shell =  "bash -c 'BASH_ENV=/etc/profile exec bash'"

    rbs3.vm.box      = 'lmayorga1980/ubuntu-trusty'
    rbs3.vm.hostname = 'rabbitmqserver3'
    rbs3.vm.network   :private_network, ip: '10.11.0.102'
    rbs3.vm.provision :shell, path: 'scripts/initial-setup.sh'
    rbs3.vm.provision :shell, path: 'scripts/install-puppet-modules.sh'
    rbs3.vm.provision :shell, inline: 'echo 10.11.0.100 rabbitmqserver1 >> /etc/hosts'
    rbs3.vm.provision :shell, inline: 'echo 10.11.0.101 rabbitmqserver2 >> /etc/hosts'

    rbs3.vm.provision :puppet do |puppet|
      puppet.manifests_path = 'manifests'
      puppet.manifest_file  = 'site.pp'
      puppet.module_path    = 'modules'
      puppet.options = '--verbose'
    end

    #ubuntu.vm.provision :shell, path: 'scripts/post-puppet-provisioning.sh'

    rbs3.vm.provider :virtualbox do |v|
      v.gui = false
      v.memory = 512
      v.cpus   = 2
    end
  end

  #bunny client (random queue creation)
  config.vm.define :bunny do |bunny|

    #https://github.com/mitchellh/vagrant/issues/1673#issuecomment-28288042
    bunny.ssh.shell =  "bash -c 'BASH_ENV=/etc/profile exec bash'"

    bunny.vm.box      = 'lmayorga1980/ubuntu-trusty'
    bunny.vm.hostname = 'bunny1'
    bunny.vm.network   :private_network, ip: '10.11.0.103'
    bunny.vm.provision :shell, path: 'scripts/initial-setup.sh'
    bunny.vm.provision :shell, inline: 'echo 10.11.0.100 rabbitmqserver1 >> /etc/hosts'
    bunny.vm.provision :shell, inline: 'echo 10.11.0.101 rabbitmqserver1 >> /etc/hosts'
    bunny.vm.provision :shell, inline: 'echo 10.11.0.102 rabbitmqserver3 >> /etc/hosts'

    bunny.vm.provision :puppet do |puppet|
      puppet.manifests_path = 'manifests'
      puppet.manifest_file  = 'site.pp'
      puppet.module_path    = 'modules'
      puppet.options = '--verbose'
    end  

    #ubuntu.vm.provision :shell, path: 'scripts/post-puppet-provisioning.sh'

    bunny.vm.provider :virtualbox do |v|
      v.gui    = false
      v.memory = 512
      v.cpus   = 2
    end
  end



end
