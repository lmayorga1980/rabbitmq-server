 puppet module list | grep puppetlabs-rabbitmq

  if ! [ $? -eq 0 ]; then
  puppet module install puppetlabs-rabbitmq
 fi

 puppet module list | grep nanliu-staging

 if ! [ $? -eq 0 ]; then
  puppet module install nanliu-staging
 fi

 puppet module list | grep puppetlabs-apt

 if ! [ $? -eq 0 ]; then
  puppet module install puppetlabs-apt
 fi

 puppet module list | grep puppetlabs-stdlib

 if ! [ $? -eq 0 ]; then
  puppet module install puppetlabs-stdlib
 fi
