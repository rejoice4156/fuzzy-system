# Cisco Switch Configuration

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
