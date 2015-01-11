'''
AUTHOR:      Daniel Klopp (dsklopp@gmail.com)
LICENSE:     MIT
DESCRIPTION: Server daemon for HAProxy, used to start and stop the daemon
'''

module HaproxyRest
  class Server
    def initialize()
      puts "Initialized HaproxyRest::" + self.class
    end
  end
end
