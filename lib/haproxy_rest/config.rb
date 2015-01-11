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
    def initialize()
      puts "Initialized HaproxyRest::" + self.class
    end
  end
end
