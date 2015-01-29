'''
AUTHOR:      Daniel Klopp (dsklopp@gmail.com)
LICENSE:     MIT
DESCRIPTION: Placeholder to import all relevant code
'''

require "haproxy_rest/version"
require_relative 'haproxy_rest/config'
require_relative 'haproxy_rest/server'
require_relative 'haproxy_rest/api'

module HaproxyRest
  class Haproxy
    attr_reader :title
    def initialize()
      @title = "HAProxy REST API Daemon Module"
      Api.new()
    end
  end
end
