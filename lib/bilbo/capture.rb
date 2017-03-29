module Bilbo

  # Capture packets simply.
  # @author Kent 'picat' Gruber
  class Capture
    # packet stream
    # @return [PCAPRUB::Pcap]
    attr_reader :packet_stream

    # interface to capture on 
    # @return [String]
    attr_accessor :iface

    # amount of data for each frame that is actually captured
    # @return [Integer]
    attr_accessor :snaplen

    # capture packets in promiscuous mode
    # @return [Boolean]
    attr_accessor :promisc

    # capture packet timeout
    # @return [Integer]
    attr_accessor :timeout

    # Create a new Bilbo capture instance.
    #
    # == Simple Defaults
    # You can let bilbo take care of things for you with its defaults:
    #  cap = Bilbo::Capture.new(start: true)
    #   
    # == Custom Options
    # You can also set you own options with defaults and check them easily:
    #   cap = Bilbo::Capture.new(iface: "eth0")
    #   cap.iface
    #   # => "eth0"
    #   
    def initialize(args={})
      @iface   = args[:iface]   || Pcap.lookupdev # lookup default interface
      @snaplen = args[:snaplen] || 65535          # default snaplen
      @promisc = args[:promisc] || false          # default promisc
      @timeout = args[:timeout] || 0              # default timeout
      start(args) if args[:start]
      if block_given?
        start
        @packet_stream.each { |packet| yield packet }
      end
    end

    # Start the actual packet capturing.
    # @param [Hash] args capture options when started
    # @option options [String] :iface interface to capture on
    # @option options [Integer] :snaplen ammount of data for each frame that is actually captured
    # @option options [Boolean] :promisc whether to capture in promiscuous mode or not 
    # @option options [Integer] :timeout ammount for timeout on capture
    # @return [PCAPRUB::Pcap]
    #
    # == Example
    #
    #   cap = Bilbo::Capture(iface: "eth0")
    #   cap.start
    #
    # == Block Example
    #
    #   cap = Bilbo::Capture(iface: "eth0")
    #   cap.start do |packet|
    #     # do something with packet
    #   end
    #
    def start(args={})
      iface   = args[:iface]   || @iface   # default interface
      snaplen = args[:snaplen] || @snaplen # default snaplen
      promisc = args[:promisc] || @promisc # default promisc
      timeout = args[:timeout] || @timeout # default timeout
      @packet_stream = Pcap.open_live(iface, snaplen, promisc, timeout) 
      if block_given?
        @packet_stream.each { |packet| yield packet }
      end
    end

    # Simple interface to work with the +packet stream+.
    #
    # @param [Hash] args options to wrangle streaming packets, totally optional
    # @option options [Integer] :count ammount of packets to wrangle up 
    #
    # @example Block
    #   
    #   cap = Bilbo::Capture(iface: "eth0")
    #   cap.start 
    #   cap.packets do |packet|
    #       
    #   end
    #   
    # @example Direct PCAP:Pcap Access
    #
    #   cap = Bilbo::Capture(iface: "eth0")
    #   cap.start 
    #   cap.packets 
    #   # => <PCAPRUB::Pcap>
    #   cap.packets.each do |packet|
    #     # do something with the packet
    #   end
    #   cap.packets.stats
    #
    # @example Wrangle a few packets
    #
    #   cap = Bilbo::Capture(iface: "eth0")
    #   cap.start 
    #   cap.packets(count: 30)
    #   
    #
    def packets(args={})
      if block_given?
        @packet_stream.each { |packet| yield packet }
      else
        if args[:count]
          packets = []
          @packet_stream.each do |packet| 
            packets << packet
            break if packets.count.eql? args[:count]
          end
          return packets
        end
        @packet_stream 
      end
    end

  end

end
