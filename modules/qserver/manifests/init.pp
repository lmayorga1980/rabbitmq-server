class qserver($node_name, $cluster_node_type, $cluster_nodes) {

  file {'/home/vagrant/.ssh/authorized_keys':
    ensure => present,
    source => 'puppet:///modules/qserver/authorized_keys',
    mode   => '0600',
    owner  => 'vagrant',
    group  => 'vagrant',
  }

  package { 'rabbitmq-server':
    ensure => present,
  } ->

  exec { 'stop rabbitmq-server':
    command   => '/usr/sbin/service rabbitmq-server stop',
    logoutput => true,
  } ->

  file { '/var/lib/rabbitmq/.erlang.cookie':
    ensure => present,
    source => 'puppet:///modules/qserver/erlang.cookie',
    mode   => '0400',
    owner  => 'rabbitmq',
    group  => 'rabbitmq',
  } ->

  exec { 'start rabbitmq-server':
    command   => '/usr/sbin/service rabbitmq-server start',
    logoutput => true,
  }

  #class { 'rabbitmq':
  #  service_manage    => true,
  #  port              => '5672',
  #  delete_guest_user => true,
  #  environment_variables   => {
  #  'RABBITMQ_NODENAME'     => $nodename,
  #  'RABBITMQ_SERVICENAME'  => 'RabbitMQ',
  #  },
  #  erlang_cookie => 'LCYFNFDSMYAXKRVSAPZS',
  #  wipe_db_on_cookie_change => true,
  #   config_cluster    => true,
  #   cluster_nodes     => $cluster_nodes,
  #   cluster_node_type => $cluster_node_type,
  #}
}


