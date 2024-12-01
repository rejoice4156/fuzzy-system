## Securing Cisco Network Devices

### Use auto secure command?
```
Router(config)# auto secure
```

### Enable Password Encryption
To encrypt all plaintext passwords:
```
R1(config)# service password-encryption
```

### Set Minimum Password Length
To enforce a minimum password length of 8 characters:
```
R1(config)# security passwords min-length 8
```

### Configure Login Block
To block login attempts for 120 seconds if there are 3 failed attempts within 60 seconds:
```
R1(config)# login block-for 120 attempts 3 within 60
```

### Configure VTY Lines
To secure VTY lines with a password and set an exec-timeout:
```
R1(config)# line vty 0 4
R1(config-line)# password cisco123
R1(config-line)# exec-timeout 5 30
R1(config-line)# transport input ssh
R1(config-line)# end
```

### Verify VTY Configuration
To verify the VTY line configuration:
```
R1# show running-config | section line vty
line vty 0 4
 password 7 094F471A1A0A
 exec-timeout 5 30
 login
 transport input ssh
```

### Configure SSH
To configure SSH for secure remote access:
```
Router# configure terminal
Router(config)# hostname R1
R1(config)# ip domain name span.com
R1(config)# crypto key generate rsa general-keys modulus 1024
```
The name for the keys will be: R1.span.com
```
% The key modulus size is 1024 bits
% Generating 1024 bit RSA keys, keys will be non-exportable...[OK]
Dec 13 16:19:12.079: %SSH-5-ENABLED: SSH 1.99 has been enabled
```

### Create a User
To create a user with a secret password:
```
R1(config)# username Bob secret cisco
```

### Configure VTY for Local Login
To configure VTY lines to use local login and SSH:
```
R1(config)# line vty 0 4
R1(config-line)# login local
R1(config-line)# transport input ssh
R1(config-line)# exit
```

### Show IP Ports
To display all IP ports:
```
Router# show ip ports all
Proto Local Address               Foreign Address             State       PID/Program Name
tcp   :::443                      :::*                        LISTEN      309/[IOS]HTTP CORE
tcp   *:443                       *:*                         LISTEN      309/[IOS]HTTP CORE
udp   *:67                        0.0.0.0:0                               387/[IOS]DHCPD Receive
```

### Show Open Ports
To display open ports on the control plane:
```
Router# show control-plane host open-ports
Active internet connections (servers and established)
Prot        Local Address      Foreign Address                  Service    State
tcp                 *:23                  *:0                   Telnet     LISTEN
tcp                 *:80                  *:0                HTTP CORE     LISTEN
udp                 *:67                  *:0            DHCPD Receive     LISTEN
```

### Disable HTTP Server
To disable the HTTP server:
```
Router# configure terminal
Router(config)# no ip http server
```

### Configure VTY for SSH Only
To configure VTY lines to accept only SSH connections:
```
Router(config)# line vty 0 15
Router(config-line)# transport input ssh
```
