# path setting magic for example directory only
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "bilbo"

# start a new capture instance
Bilbo::Capture.new do |packet|
  # do something with the packet
end

