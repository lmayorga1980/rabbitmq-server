require "bunny"

conn = Bunny.new(:hostname => "10.11.0.100")
conn.start

ch   = conn.create_channel
q    = ch.queue("hello")

q.subscribe(:block => true) do |delivery_info, properties, body|
  puts " [x] Received #{body}"

  # cancel the consumer to exit
  delivery_info.consumer.cancel
end
