

node '/^rabbitmqserver\d+$/' {
  include rabbitmq
}

node 'bunny1' {
  include nodejs
}
