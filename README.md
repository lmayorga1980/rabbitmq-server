Rabbitmq Cluster Demo
===============

RabbitMQ Server provisioned with Puppet on Ubuntu Trusty

Requirements
===============

* Vagrant 1.6.3 or later
* Virtualbox 4.3.10 or later

How does it work?
===============

* Start the rabbitmq server cluster `vagrant up`
* The **vagrant up** command will create 3 rabbitmq servers and 1 bunny client.

Issues
======

* Still have some issues with puppetlabs/rabbitmq puppet module and the cluster feature
