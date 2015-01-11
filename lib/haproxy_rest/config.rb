'''
AUTHOR:      Daniel Klopp (dsklopp@gmail.com)
LICENSE:     MIT
DESCRIPTION: A representation of HAProxy config file.
             Pedantically, we will modify the file by searching
             it and using gsub to change the only line we care about.
             Realistically, it would be better to represent the file
             as some simplistic hash and array data structure, which is
             written out with an ERB template.  But that introduces
             components not appropriate for a fundamentals class.  For
             further information please review ERB templates
'''

module HaproxyRest
  class Config
    def initialize(config_file="/etc/haproxy/haproxy.cfg")
      puts "Initialized HaproxyRest::" + self.class.to_s
      @config_file=config_file
      # http://rubylearning.com/satishtalim/ruby_exceptions.html
      if not File.exist?(config_file)
        raise IOError, "Error, the HAProxy Config File \"" + @config_file + "\" was not found."
      end
    end

    def backends()
      in_backend = nil
      backends={}
      self._get_config.each do |line|
        words = line.split()
        if in_backend and words[0] == 'server'
          backends[in_backend] << words[1..-1]
        elsif words[0] == "backend"
          in_backend=words[1]
          backends[in_backend] = []
        else
          in_backend=nil
        end
      end
      return backends
    end

    def _write_backend(backend)
      backends = self.backends
      if not backends.has_key?(backend)
        # http://rubylearning.com/satishtalim/ruby_exceptions.html
        raise ArgumentError, "Key \"" + backend.to_s  +  "\" not found in backend."
      end
      lines=[]
      _get_config().each do |line|
        words = line.split()
        if words[0] == 'default_backend'
          lines << 'default_backend ' + backend.to_s
        else
          lines << line
        end
      end
      self._write_config(lines)
    end
    def backend(backend=nil)
      if backend.nil?
        return backends[ self.frontend ]
      else
        _write_backend(backend)
      end
    end

    def frontend
      self._get_config.each do |line|
        words=line.split()
        if words[0] == 'default_backend'
          return words[1]
        end
      end
    end

    def _get_config()
      lines=[]
      File.open(@config_file).each do |line|
        lines << line.strip()
      end
      return lines
    end

    def _write_config(lines)
      file=File.open(@config_file, 'w')
      lines.each do |line|
        file.write(line+"\n")
      end
      file.close
    end
  end
end
