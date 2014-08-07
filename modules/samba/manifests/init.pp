# == Class: samba
#
# Full description of class samba here.
#
#
# === Authors
#
# Luis Mayorga <luis.mayorga@nreca.coop>
#
# === Copyright
#
# Copyright 2014 NRECA.
#
class samba {

  package { 'samba':
    ensure => present,
  } ->

  file { '/etc/samba/smb.conf':
    ensure  => present,
    content => template('samba/smb.conf'),
    notify  => [Service['smbd'],Service['nmbd']]
  }

  service { 'smbd' :
    ensure => running,
    enable => true,
  }

  service { 'nmbd' :
    ensure => running,
    enable => true,
  }  
}
