  #i had some errors intalling this package with puppet.
  npm install -g pm2@0.8.0 --loglevel error
  echo '----------------------------------------'

  echo 'changing permissions on gems'
  chown vagrant:vagrant /home/vagrant/gems -R
  echo '----------------------------------------'

  echo 'installing npm local packages from packages.json'
  sudo -H -u vagrant bash -c 'cd /home/vagrant/gems && npm install --loglevel error' 
  echo '----------------------------------------'

  echo 'start server with gulp'
  sudo -H -u vagrant bash -c 'cd /home/vagrant/gems && gulp serve'
  echo '----------------------------------------'