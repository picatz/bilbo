# path setting magic for example directory only
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "bilbo"
require "pry"

binding.pry
