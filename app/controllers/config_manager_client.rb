require 'socket'      # Sockets are in standard library

class ConfigManagerClient
	
	hostname = 'localhost'
	port = 2800


	def initialize
	end

	def send


		command = '0036COMMAND:START_HLS||IW||CAMERAID:1973'

		s = TCPSocket.open(hostname, port)

		s.print(command)
		s.print('\n');

		response = s.read

		s.close               # Close the socket when do
		print response
		
		return response

	end


end
