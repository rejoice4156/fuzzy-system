inxi paigaldamine Ubuntus:
sudo apt update && sudo apt -y install inxi && sudo apt clean

#suuname väljundi HTML-vormingus faili, mida hiljem veebilehitsejaga vaadata
sudo lshw -html > riistvara.html

# OS'i versiooni ja distro kindlakstegemiseks (man lsb_release)
lsb_release -a, screenfetch

# tuuma kindlakstegemiseks
uname -sr

# OS'i poolt kasutatava CPU arhitektuuri kindlakstegemiseks
arch

# kasutatavate varamute tuvastamiseks (serverid tarkvara turvaliseks hoidmiseks)
inxi -r

# emaplaadi, süsteemiinfo tuvastamiseks
inxi -xxM, inxi -xxxS

# sensorite teave (kui on paigaldatud) temperatuuri, jahutusventilaatori pöörete arvu jms tuvastamiseks
inxi -s

# protsessori teave
cat /proc/cpuinfo
inxi -C
inxi -xxC
lscpu # muuhulgas näeb ära CPU toetatud bitid

# protsessori-, mälukasutuse tuvastamiseks
inxi -t c
inxi -t cm
top

# mälukasutus
cat /proc/meminfo
inxi -t m
sudo dmidecode -t memory
sudo lshw -class memory
free -h

# PCI ja PCI Express seadmete tuvastamiseks
lspci -tvnn

# USB-seadmete tuvastamiseks
lsusb ja lsusb -t

# ketaste ja nende jagude tuvastamiseks
sudo fdisk -l
lsblk -f
findmnt -D
inxi -p

# kõvaketta tüübi, mudeli, tootja, püsivara (firmware) versiooni, S/N jne tuvastamiseks. Millist teavet teada saate, mis teave ja kuidas võiks kasulik olla?
sudo hdparm -I /dev/sdx # (asenda sdx oma seadmega)
cat /proc/scsi/scsi
sudo lshw -class disk -class storage
sudo lshw -short -C disk
inxi -D

# kuvarežiimide tuvastamiseks, 3D-kiirenduse testimiseks
xrandr
xdpyinfo
glxgears
glxheads

# heliseadmete tuvastamiseks
cat /proc/asound/cards
inxi -xxA

# veelgi rohkema teabe saamiseks arvutist
dmidecode, inxi -I

# võrguliideste teave
ifconfig -a
ip addr list
inxi -xi
inxi -xxN
inxi -xn

# traadita võrguliideste tuvastamiseks
iwconfig või iw list

# Bluetooth seadmete tuvastamiseks. Kas on mõni seade leitud?
hcitool dev

# 3D-kiirenduse võimekuse tuvastamiseks.
# Kas 3D-kiirendus töötab? (vihje: kas direct rendering on lubatud?)
glxinfo -B
glxinfo | grep -i opengl
inxi -xG

# graafikakaardi teabe tuvastamine
lspci -vnn | grep VGA -A 12
sudo lshw -numeric -C display
inxi -G

# inxi kasutamine
inxi -h	#abiteave
inxi -b	#põhiteave
inxi -F	#detailne teave
inxi -xF	#detailsuse aste kasvab
inxi -xxF	#detailsuse aste kasvab
inxi -xxxF	#detailsuse aste kasvab
