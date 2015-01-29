'''
AUTHOR:      Daniel Klopp (dsklopp@gmail.com)
LICENSE:     MIT
DESCRIPTION: REST Daemon Api handler

The API to this is simple

/backend - show the active backend
/backends - show all available backends
/backend/$backend - set the backend to $backend

'''

# Very special thanks to
# https://practicingruby.com/articles/implementing-an-http-file-server
require 'socket'
require_relative 'server'
require_relative 'config'
module HaproxyRest
  class Api
    attr_accessor :server
    def initialize port=8181
      @daemon = HaproxyRest::Server.new("minimal.cfg")
      #@data.default="NONE"
      @port = port || 8181
      @server = TCPServer.new @port
      loop {
        client = server.accept
        request = client.gets
        client.puts handle request
        client.close
      }
    end

    def handle arg
      verb = arg.split()[0]
      arg=arg.split()[1..-1].join(" ")
      if verb == 'GET'
        return handle_get arg
      end
    end

    def handle_get arg
      path = (arg.split[0]).split('/')[1..-1]
      if path.nil?
        return [ 'backend', 'backends', 'backend/$name' ]
      elsif path.size == 2 and path[0] == 'backend'
        return @daemon.backend(path[1])
      elsif path[0] == 'backends'
        return @daemon.backends
      elsif path[0] == 'backend'
        return @daemon.backend
      end
    end
  end
  Api.new()
end
