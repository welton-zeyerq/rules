#!/usr/bin/env zsh
iptables -F
iptables -t raw -A PREROUTING -p udp -m udp -i eth0 -j DROP
iptables -t raw -A PREROUTING -p udp -m udp -i lo -j DROP
iptables -t raw -A PREROUTING -p icmp -i eth0 -j DROP
iptables -t raw -A PREROUTING -p icmp -i lo -j DROP
iptables -P INPUT DROP
iptables -t filter -A INPUT -p udp -i eth0 --destination 0.0.0.0/0 -j DROP
iptables -t filter -A INPUT -p udp -i lo --destination 0.0.0.0/0 -j DROP
iptables -t filter -A INPUT -p icmp -i eth0 --destination 0.0.0.0/0 -j DROP
iptables -t filter -A INPUT -p icmp -i lo --destination 0.0.0.0/0 -j DROP
iptables -A INPUT -m state --state INVALID -j DROP
iptables -A INPUT -m conntrack --ctstate INVALID -j DROP
iptables -A INPUT -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG FIN,SYN,RST,ACK -j DROP
iptables -A INPUT -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
iptables -A INPUT -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
iptables -A INPUT -f -i eth0 -j DROP
iptables -A INPUT -f -i lo -j DROP
iptables -A INPUT -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG FIN,SYN,RST,PSH,ACK,URG -j DROP
iptables -A INPUT -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j DROP
iptables -A INPUT -i eth0 -p tcp -j ACCEPT
iptables -A INPUT -i lo -p tcp -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED -p tcp -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED -p udp -j DROP
iptables -A INPUT -m state --state ESTABLISHED -p icmp -j DROP
iptables -A INPUT -j DROP
iptables -t filter -A OUTPUT -p udp -o eth0 --destination 0.0.0.0/0 -j DROP
iptables -t filter -A OUTPUT -p udp -o lo --destination 0.0.0.0/0 -j DROP
iptables -t filter -A OUTPUT -p icmp -o eth0 --destination 0.0.0.0/0 -j DROP
iptables -t filter -A OUTPUT -p icmp -o lo --destination 0.0.0.0/0 -j DROP
iptables -A OUTPUT -m state --state INVALID -j DROP
iptables -A OUTPUT -m conntrack --ctstate INVALID -j DROP
iptables -A OUTPUT -m state --state ESTABLISHED -p tcp -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED -p udp -j DROP
iptables -A OUTPUT -m state --state ESTABLISHED -p icmp -j DROP
iptables -A FORWARD -j DROP
iptables -t filter -A FORWARD -p udp -o eth0 --destination 0.0.0.0/0 -j DROP
iptables -t filter -A FORWARD -p udp -o lo --destination 0.0.0.0/0 -j DROP
iptables -t filter -A FORWARD -p icmp -o eth0 --destination 0.0.0.0/0 -j DROP
iptables -t filter -A FORWARD -p icmp -o lo --destination 0.0.0.0/0 -j DROP
iptables -A FORWARD -m state --state INVALID -j DROP
iptables -A FORWARD -m conntrack --ctstate INVALID -j DROP
iptables -A FORWARD -m state --state ESTABLISHED -p tcp -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED -p udp -j DROP
iptables -A FORWARD -m state --state ESTABLISHED -p icmp -j DROP
iptables -t mangle -A POSTROUTING -p udp -m udp -o eth0 --destination 0.0.0.0/0 -j DROP
iptables -t mangle -A POSTROUTING -p udp -m udp -o lo --destination 0.0.0.0/0 -j DROP
iptables -t mangle -A POSTROUTING -p icmp -o eth0 --destination 0.0.0.0/0 -j DROP
iptables -t mangle -A POSTROUTING -p icmp -o lo --destination 0.0.0.0/0 -j DROP

ip6tables -F
ip6tables -t raw -A PREROUTING -i eth0 --destination 0.0.0.0/0 -j DROP
ip6tables -t raw -A PREROUTING -i lo --destination 0.0.0.0/0 -j DROP
ip6tables -P INPUT DROP
ip6tables -P OUTPUT DROP
ip6tables -P FORWARD DROP
ip6tables -A INPUT -j REJECT --reject-with adm-prohibited
ip6tables -A INPUT -i eth0 --destination 0.0.0.0/0 -j DROP
ip6tables -A INPUT -i lo --destination 0.0.0.0/0 -j DROP
ip6tables -A OUTPUT -j REJECT --reject-with adm-prohibited
ip6tables -A OUTPUT -o eth0 --destination 0.0.0.0/0 -j DROP
ip6tables -A OUTPUT -o lo --destination 0.0.0.0/0 -j DROP
ip6tables -A FORWARD -j REJECT --reject-with adm-prohibited
ip6tables -A FORWARD -p icmp -j REJECT --reject-with icmp6-adm-prohibited
ip6tables -A FORWARD -o eth0 --destination 0.0.0.0/0 -j DROP
ip6tables -A FORWARD -o lo --destination 0.0.0.0/0 -j DROP
