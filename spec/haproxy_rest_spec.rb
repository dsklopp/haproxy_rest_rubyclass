####require 'spec_helper'

require 'haproxy_rest'

describe HaproxyRest do
  it 'loads module and prints out static value' do
    HaproxyRest::Haproxy.new().title.should eql "HAProxy REST API Daemon Module"
  end
end

