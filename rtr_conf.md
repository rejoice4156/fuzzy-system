# Cisco Router Configuration

## General

Router> enable
Router# configure terminal
Router(config)# hostname R1
R1(config)# no ip domain-lookup
R1(config)# enable secret class
R1(config)# line console 0
R1(config-line)# password cisco
R1(config-line)# login
R1(config-line)# exit
R1(config)# line vty 0 4
R1(config-line)# password cisco
R1(config-line)# login
R1(config-line)# transport input ssh telnet
R1(config-line)# exit
R1(config)# service password-encryption
R1(config)# banner motd # WARNING: Unauthorized access is prohibited! #
R1(config)# ipv6 unicast-routing
R1(config)# end
R1# copy running-config startup-config

## Interfaces

R1> enable
R1# configure terminal
R1(config)# interface gigabitEthernet 0/0/0
R1(config-if)# description Link to LAN
R1(config-if)# ip address 192.168.10.1 255.255.255.0
R1(config-if)# ipv6 address 2001:db8:acad:10::1/64
R1(config-if)# ipv6 address fe80::1:1 link-local
R1(config-if)# no shutdown
R1(config-if)# exit
R1(config)# end
R1# copy running-config startup-config

## Verify

R1# show ip interface brief
R1# show ipv6 interface brief
R1# show ip route
R1# show ipv6 route
R1# show interfaces
R1# show ipv6 interface brief
R1# show ip interface
R1# show ipv6 interface
R1# show interfaces gig0/0/0
R1# show ip interface g0/0/0
R1# show ipv6 interface g0/0/0
