require 'socket'

socket = TCPServer.new('0.0.0.0', '8080')
socket.setsockopt(Socket::SOL_SOCKET, Socket::SO_REUSEADDR, 1)
loop do
  client = socket.accept
  data = ''
  loop do
    event = select([client],nil,nil,0.5)
    if client.eof? # Socket's been closed by the client
      # puts "Connection closed"
      # client.close
      break
    else
      begin
        if client.respond_to?(:read_nonblock)
          10.times {
            data << client.read_nonblock(4096)
          }
        else
          data << client.sysread(4096)
        end
      rescue Errno::EAGAIN, Errno::EWOULDBLOCK => e
        # no-op. This will likely happen after every request, but that's expected. It ensures that we're done with the request's data.
      rescue Errno::ECONNRESET, Errno::ECONNREFUSED, EOFError => e
        # puts "Closed Err: #{e.inspect}"; $stdout.flush
      end
    end
  end
  puts "Web Browser said:\n\n#{data}"
  get_req = data.match(/GET \/(.*) HTTP/)[1]
  if get_req == 'favicon.ico'
    puts "Asked for favicon!"
    icon = File.read('favicon.ico')
    client.puts "HTTP/1.1 200 OK\n\n#{icon}"
  else
    client.puts "HTTP/1.1 200 OK\nContent-Type: text/html\n\n<h1>Hello World!</h1>"
  end
  client.close
end
socket.close
