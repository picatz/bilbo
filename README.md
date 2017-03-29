# Bilbo

Bilbo is a tiny packet capture library built on [pcaprub](https://github.com/pcaprub/pcaprub) for an interface to libpcap. 


![Bilbo Baggins](https://upload.wikimedia.org/wikipedia/en/1/1f/Bilbo_Baggins_Tolkien_illustration.jpg)

### Why?

You never know when you're going need a simple, hobbit-like ( small ) network packet burglaring ( capturing ) library such as Bilbo.

## Installation

    $ gem install bilbo

## Usage

Packet capturing with Bilbo is incredibly straight-forward.

```ruby
require 'bilbo'

Bilbo::Capture.new do |packet|
  # do something with the packet 
end
```
### Customizations

Of course!

```ruby
require 'bilbo'

cap = Bilbo::Capture.new
 
cap.iface   = "en0"  # interface en0
cap.promisc = true   # promiscuous mode, on
cap.start            # start capturing

cap.packets do |packet|
  # do something with the packet 
end
```

Pretty flexible, doing the same thing as above:

```ruby
require 'bilbo'

cap = Bilbo::Capture.new(iface: "en0", promisc: true)
cap.start do |packet|
  # do something with the packet 
end 
```

### Packet Parsing?

Bilbo provides no packet parsing abstractions. You can use something like [PacketGen](https://github.com/sdaubert/packetgen) with Bilbo together:

### PacketGen

PacketGen works really well for parsing the packets into a human-friendly interface.

```ruby
require 'bilbo'
require 'packetgen'

cap = Bilbo::Capture.new

cap do |packet|
  parsed_packet = PacketGen.parse(packet)
  # do something with the parsed packet 
end
```

### PacketFu

Since Bilbo is simply capturing packets, you can easily use [PacketFu](https://github.com/packetfu/packetfu) if wanted to:

```ruby
require 'bilbo'
require 'packetfu'

cap = Bilbo::Capture.new

cap do |packet|
  parsed_packet = PacketFu::Packet.parse(packet)
  # do something with the parsed packet 
end
```
### TODO's

* Methods for checking state of the capture, like:
```ruby
require 'bilbo'

cap = Bilbo::Capture.new(start: true)

cap.capturing?
# => true

cap.started? 
# => true

# stop capture
cap.stop

# but, we know it was started beforehand
cap.started?
# => true

# and we can check that we aren't capturing still
cap.capturing?
# => false
```
* Check internal documentation and inline documentation for ma' errorz.
* More packet wrangle'n features for the `.packets()` method?
* Some sort of PacketFu/PacketGen shell like functionality.
* Write some sort of ngrep like clone using Bilbo.

### ❤️  Ruby Community

Bilbo has taken inspriation from many ruby packet capturing / parsing gems:

* [PacketGen](https://github.com/sdaubert/packetgen)
* [PacketFu](https://github.com/packetfu/packetfu)
* [pcaprub](https://github.com/pcaprub/pcaprub)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

