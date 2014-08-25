class qserver($node_name, $cluster_node_type, $cluster_nodes) {

  class { 'rabbitmq':
    service_manage    => true,
    port              => '5672',
    delete_guest_user => true,
    environment_variables   => {
    'RABBITMQ_NODENAME'     => $nodename,
    'RABBITMQ_SERVICENAME'  => 'RabbitMQ',
    },
    config_cluster    => true,
    cluster_nodes     => $cluster_nodes,
    cluster_node_type => $cluster_node_type,
    wipe_db_on_cookie_change => true,
  }
}
