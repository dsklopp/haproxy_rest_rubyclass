require "haproxy_rest/version"
#require_relative 'haproxy_rest/service_control'
#require_relative 'haproxy_rest/haproxy_config'
#require_relative 'haproxy_rest/server'
#require_relative 'haproxy_rest/api'

module HaproxyRest
  class Server
    attr_reader :title
    def initialize()
      @title = "HAProxy REST API Daemon Module"
    end
  end
end
