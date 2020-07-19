require 'socket'

BUFFER_SIZE = 1024

host = 'localhost'
port = 4000

socket = UDPSocket.new
socket.bind(host, port)

loop do
  message, sender = socket.recvfrom(BUFFER_SIZE)
  port = sender[1]
  host = sender[2]
  remote = sender[3]

  puts "#{remote} sent #{message}"

  response = (message.to_i * 2).to_s
  puts "We'll respond with #{message.upcase}"

  socket.send(message.upcase, 0, host, port)
end
