apt install iptables tor -y
systemctl enable tor.service

apt install apt-transport-tor apt-transport-https torsocks nyx -y



git clone 

chattr +i /etc/systemd/system/initrules.service



systemctl daemon-reload
systemctl enable initrules



echo '''# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
allow-hotplug eth0
iface eth0 inet static
    address 10.0.0.161
    netmask 255.255.255.255
    gateway 10.0.0.1
    broadcast 127.255.255.255
    dns-nameservers 185.199.108.153
''' >/etc/network/interfaces
chattr +i /etc/network/interfaces



echo '''DNSPort 9053
AutomapHostsOnResolve 1''' >>/etc/tor/torrc
sed -i 's/\#SocksPort\ 9050/SocksPort\ 9050/g' /etc/tor/torrc
sed -i 's/\#ControlPort/ControlPort/g' /etc/tor/torrc
chattr +i /etc/tor/torrc


sed -i 's/#AllowInbound\ 1/AllowInbound\ 0/g' /etc/tor/torsocks.conf
sed -i 's/#AllowOutboundLocalhost\ 1/AllowOutboundLocalhost\ 0/g' /etc/tor/torsocks.conf
sed -i 's/#IsolatePID/IsolatePID/g' /etc/tor/torsocks.conf
chattr +i /etc/tor/torsocks.conf
