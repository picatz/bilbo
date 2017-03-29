# path setting magic for example directory only
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "bilbo"

# start a new capture instance on interface en0
cap = Bilbo::Capture.new(iface: 'en0') 
cap.snaplen = 1234 # lol

cap.start

cap.packets do |packet|
  # do something with the packet
end
