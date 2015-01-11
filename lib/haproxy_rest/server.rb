'''
AUTHOR:      Daniel Klopp (dsklopp@gmail.com)
LICENSE:     MIT
DESCRIPTION: Server daemon for HAProxy, used to start and stop the daemon
'''

module HaproxyRest
  class Server
    def initialize(config=HaproxyRest::Config.new())
      if config.is_a? String
        @config=HaproxyRest::Config.new(config)
      else
        @config=config
      end
      puts "Initialized HaproxyRest::" + self.class.to_s
    end
    def backend(backend=nil)
      if backend
        @config.backend(backend)
        self.restart
      else
        return @config.backend(backend)
      end
    end
    def start()
      `sudo service haproxy start`
    end
    def stop()
      `sudo service haproxy stop`
    end
    def restart()
      `sudo service haproxy restart`
    end
  end
end
