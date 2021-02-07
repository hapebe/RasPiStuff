# Ethernet bridge for wiretapping (myself!) using a Raspberry Pi 4

## dhcpcd in Raspbian buster...

For advanced / old-school settings in `/etc/network/interfaces` I got rid of the DHCP client daemon services that is by default in charge of the Raspi's networking:
```bash
systemctl disable dhcpcd
```

## Ethernet bridges in debian

Credits to [https://wiki.debian.org/BridgeNetworkConnections] .

The whole time I was using the built-in Ethernet port of the Raspi to remote control it via SSH. By the way `geany` worked quite well via X forwarding!

I used two very cheap USB network adapters of the same kind, and it turned out they actually used the *same* MAC address, that's why I had to add the call to `ip link set address`.

```bash 
apt install bridge-utils
```

```bash 
ip link set eth2 address 00:e0:4c:53:44:59
brctl addbr br0
brctl addif br0 eth1 eth2
ip link set br0 up
``` 

## Making it persistent: /etc/network/interfaces

As noted above, this did not / will not work with an active DHCP client daemon service.

See my specific config in: [/etc/network/interfaces](interfaces) .

## Disable IPv6

In yet another old-school move, I disabled IPv6 support from the bridge interface:

In `/etc/sysctl.conf` add the following line:
```
net.ipv6.conf.br0.disable_ipv6=1
```
and
```bash
sysctl -p
```

Of course, there might be a lot of IPv6 activity on a network segment these days, even if the outside routing does not support it!

## tcpdump

Some relevant tcpdump uses:
  * `tcpdump --list-interfaces`
  * `tcpdump -i br0 -vvv`
  * `tcpdump -i br0 -c 1 -X port 53` (-X dumps with, -x w/o ASCII decoding)
  * `tcpdump -i br0 -s 0 -w tcpdump.pcap`

