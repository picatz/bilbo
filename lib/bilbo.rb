require "bilbo/version"
require "bilbo/capture"
require "pcaprub"


# Bilbo is a Bilbo is a simple, +hobbit-like+ ( small ) network packet +burglaring+ ( capturing ) library. 
# # @author Kent 'picat' Gruber
module Bilbo
  
  # A few quotes from dear 'ol Mr. Bilbo Baggins
  # @easter_egg
  QUOTES = [
    "It's a dangerous business, Frodo, going out your door. You step onto the road, and if you don't keep your feet, there's no knowing where you might be swept off to.",
    "Go back? No good at all! Go sideways? Impossible! Go forward? Only thing to do! On we go!",
    "Now I know what a piece of bacon feels like when it is suddenly picked out of the pan on a fork and put back on the shelf!",
    "I will give you a name, and I shall call you Sting.",
    "I came from the end of bag, but no bag went over me. I am the friend of bears and the guest of eagles. I am Ring-winner and Luckwearer; and I am Barrel-rider.",
    "I don’t know half of you half as well as I should like; and I like less than half of you half as well as you deserve."
  ].freeze
 
  # Get a random quote from Bilbo.
  #
  # @return [String]
  def quote
    QUOTES.sample
  end

end
