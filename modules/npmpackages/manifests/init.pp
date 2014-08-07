# == Class: npmpackages
#
# Full description of class npmpackages here.
#
# === Authors
#
# Luis Mayorga <luis.mayorga@nreca.coop>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#
class npmpackages {

  require nodejs

  #TODO:Pending variable abstraction to hiera for the following npm packages

  case $::osfamily {

  Windows : {

  exec { 'dependo':
    command   => 'npm.cmd install -g dependo@0.1.1',
    logoutput => true,
    path      => 'C:\Program Files (x86)\nodejs',
    unless    => 'npm.cmd -g ls dependo@0.1.1 | c:\windows\system32\findstr.exe dependo@0.1.1'
  }

  exec { 'plato' :
    command   => 'npm.cmd install -g plato@0.6.2',
    logoutput => true,
    path      => 'C:\Program Files (x86)\nodejs',
    unless    => 'npm.cmd -g ls plato@0.6.2 | c:\windows\system32\findstr.exe plato@0.6.2'
  }

  exec { 'bower' :
    command   => 'npm.cmd install -g bower@1.2.7',
    logoutput => true,
    path      => 'C:\Program Files (x86)\nodejs',
    unless    => 'npm.cmd -g ls bower@1.2.7 | c:\windows\system32\findstr.exe bower@1.2.7'
  }

  exec { 'protractor' :
    command   => 'npm.cmd install -g protractor@0.15.0',
    logoutput => true,
    path      => 'C:\Program Files (x86)\nodejs',
    unless    => 'npm.cmd -g ls protractor@0.15.0 | c:\windows\system32\findstr.exe protractor@0.15.0'
  }

  exec { 'jasmine' :
    command   => 'npm.cmd install -g jasmine-node@1.13.1',
    logoutput => true,
    path      => 'C:\Program Files (x86)\nodejs',
    unless    => 'npm.cmd -g ls jasmine-node@1.13.1 | c:\windows\system32\findstr.exe jasmine-node@1.13.1'
  }
  }

  Debian : {

  package { 'dependo':
    ensure   => '0.1.1',
    provider => 'npm',
  } 

  package { 'plato':
    ensure   => '0.6.2',
    provider => 'npm',
  }

  package { 'bower':
    ensure   => '1.3.3',
    provider => 'npm',
  } 

  package { 'protractor':
    ensure   => '0.15.0',
    provider => 'npm',
  } 

  package { 'jasmine-node': 
    ensure   => '1.13.1',
    provider => 'npm',
  } 

  package {'gulp': 
    ensure   => '3.6.2',
    provider =>  'npm',
  }

  package {'grunt': 
    ensure   => '0.4.4',
    provider =>  'npm',
  }

  package {'grunt-cli': 
    ensure   => '0.1.13',
    provider =>  'npm',
  }
}
}
}
