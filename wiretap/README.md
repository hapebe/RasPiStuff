# Ethernet bridge for wiretapping (myself!) using a Raspberry Pi 4

## tcpdump

Some relevant tcpdump uses:
  * `tcpdump --list-interfaces`
  * `tcpdump -i eth0 -vvv`
  * `tcpdump -i eth0 -c 1 -X port 53` (-X dumps with, -x w/o ASCII decoding)
  * `tcpdump -i eth0 -s 0 -w tcpdump.pcap`

## Ethernet bridges in debian

Credits to (https://wiki.debian.org/BridgeNetworkConnections) .

The whole time I was using the built-in Ethernet port of the Raspi to remote control it via SSH. By the way `geany` worked quite well via X forwarding!
 
  * `apt install bridge-utils`
  * I used two very cheap USB network adapters of the same kind, and it turned out they actually used the *same* MAC address. That's why:
    `ip link set eth2 address 00:e0:4c:53:44:59`
  * `brctl addbr br0`
  * `brctl addif br0 eth1 eth2`
  * `ip link set br0 up`
