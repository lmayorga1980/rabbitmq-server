class gems {

  require 'npmpackages'
  
  vcsrepo { '/home/vagrant/gems':
    ensure   => present,
    provider => git,
    source   => 'http://github.nreca.org/LeanUX/gems',
  }
}