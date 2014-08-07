# == Class: nodejs
#
# Full description of class nodejs here.
#
# Copyright 2014 NRECA
class nodejs {

  package { 'nodejs' : 
    ensure => present,
  } ->

  file { '/usr/bin/node':
    ensure => 'link',
    target => '/usr/bin/nodejs',
  }

  package { 'npm' : 
    ensure => present,
  }

}
