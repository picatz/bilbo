# path setting magic for example directory only
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "bilbo"

# start a new capture instance
cap = Bilbo::Capture.new

# start the capture, optional block
cap.start do |packet|
  # do something with the packet
end
