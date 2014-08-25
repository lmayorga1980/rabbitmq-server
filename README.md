Rabbitmq-Cluster-Demo
===============

RabbitMQ Server provisioned with Puppet on Ubuntu Trusty

How Does it Work
===============

* Start every vagrant machine (`vagrant up rbs1`, `vagrant up rbs2` , `vagrant up rbs3`)
* Verify if they are running in a cluster (`sudo rabbitmqctl cluster_status`) on each server.


