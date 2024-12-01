# Cisco Switch With Router Configuration

## General

Switch> enable
Switch# configure terminal
Switch(config)# hostname S1
S1(config)# no ip domain-lookup
S1(config)# enable secret class
S1(config)# line console 0
S1(config-line)# password cisco
S1(config-line)# login
S1(config-line)# exit
S1(config)# line vty 0 15
S1(config-line)# password cisco
S1(config-line)# login
S1(config-line)# transport input ssh telnet
S1(config-line)# exit
S1(config)# service password-encryption
S1(config)# banner motd #Authorized Access Only#
S1(config)# end
S1# copy running-config startup-config

## Enable IPv6

S1# configure terminal
S1(config)# sdm prefer dual-ipv4-and-ipv6 default
S1(config)# end
S1# reload

## IP and Default Gateway

S1> enable
S1# configure terminal
S1(config)# interface vlan 1
S1(config-if)# ip address 192.168.10.2 255.255.255.0
S1(config-if)# ipv6 address 2001:db8:acad:10::2/64
S1(config-if)# no shutdown
S1(config-if)# exit
S1(config)# ip default-gateway 192.168.10.1
S1(config)# end
S1# copy running-config startup-config

## Verify

S1# show ip interface brief
S1# show ipv6 interface brief
S1# show ip route
S1# show ipv6 route
S1# show interfaces
S1# show ipv6 interface brief
S1# show ip interface
S1# show ipv6 interface
