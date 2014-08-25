
node base {
}

node 'rabbitmqserver1' inherits base {
  class{ 'qserver' :
    node_name         => 'rabbit',
    cluster_node_type => 'ram',
    cluster_nodes     => ['rabbit@rabbitmqserver2', 'rabbit@rabbitmqserver3']
  }
}

node 'rabbitmqserver2' inherits base {
  class{ 'qserver' :
    node_name         => 'rabbit',
    cluster_node_type => 'ram',
    cluster_nodes     => ['rabbit@rabbitmqserver1', 'rabbit@rabbitmqserver3']
  }
}

node 'rabbitmqserver3' inherits base {
  class{ 'qserver' :
    node_name         => 'rabbit',
    cluster_node_type => 'disc',
    cluster_nodes     => ['rabbit@rabbitmqserver1', 'rabbit@rabbitmqserver2']
  }
}

node 'bunny1' {

}

