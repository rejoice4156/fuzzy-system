S2(config)# vlan 10
S2(config-vlan)# name Faculty
S2(config-vlan)# exit​
S2(config)#
S2(config)# vlan 30
S2(config-vlan)# name Students​
S2(config-vlan)# exit​
S2(config)#
S2(config)# vlan 50
S2(config-vlan)# name Guest​
S2(config-vlan)# exit
S2(config)#
S2(config)# interface fastethernet 0/1
S2(config-if)# switchport mode access​
S2(config-if)# switchport access vlan 10
S2(config-if)# exit​
S2(config)#
S2(config)# interface range fa0/10
S2(config-if)# switchport mode access​
S2(config-if)# switchport access vlan 20
S2(config-if)# exit
S2(config)#
S2(config)# interface range fa0/20
S2(config-if)# switchport mode access​
S2(config-if)# switchport access vlan 50
S2(config-if)# exit​
S2(config)#​
