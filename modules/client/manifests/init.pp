#simple bunny client class
class client{

    file { '/home/vagrant/.ssh/id_rsa' :
    ensure => present,
    source => 'puppet:///modules/client/id_rsa',
    mode   => '0600',
    owner  => 'vagrant',
    group  => 'vagrant',
  }
}
