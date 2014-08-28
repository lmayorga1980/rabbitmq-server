#based on https://www.rabbitmq.com/clustering.html
#configure clustering on rbs2 (rabbitmqserver2) as --ram
ssh vagrant@10.11.0.101 'echo vagrant | sudo rabbitmqctl stop_app'
ssh vagrant@10.11.0.101 'echo vagrant | sudo rabbitmqctl join_cluster --ram rabbit@rabbitmqserver1'
ssh vagrant@10.11.0.101 'echo vagrant | sudo rabbitmqctl start_app'

#configure clustering on rbs3 (rabbitmqserver3) as disc
ssh vagrant@10.11.0.102 'echo vagrant | sudo rabbitmqctl stop_app'
ssh vagrant@10.11.0.102 'echo vagrant | sudo rabbitmqctl join_cluster rabbit@rabbitmqserver2'
ssh vagrant@10.11.0.102 'echo vagrant | sudo rabbitmqctl start_app'

#checking for clustering status
ssh vagrant@10.11.0.100 'echo vagrant | sudo rabbitmqctl cluster_status'
ssh vagrant@10.11.0.101 'echo vagrant | sudo rabbitmqctl cluster_status'
ssh vagrant@10.11.0.102 'echo vagrant | sudo rabbitmqctl cluster_status'
