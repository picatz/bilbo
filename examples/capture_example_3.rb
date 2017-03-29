# path setting magic for example directory only
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "bilbo"

# start a new capture instance on interface en0
Bilbo::Capture.new(iface: 'en0') do |packet|
  # do something with the packet
end

