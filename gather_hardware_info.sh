#!/bin/bash

# Set the output file path on the USB stick.
# Assumes the USB stick is mounted at /run/media/liveuser/<LABEL>.
# Replace <LABEL> with the actual label of your USB drive.
USB_LABEL="<LABEL>"
OUTPUT_DIR="/run/media/liveuser/${USB_LABEL}"
OUTPUT_FILE="${OUTPUT_DIR}/hardware_info_linux.txt"

# Check if the USB stick is mounted.
if [ ! -d "$OUTPUT_DIR" ]; then
  echo "Error: USB stick not mounted at ${OUTPUT_DIR}."
  exit 1
fi

# Gather system information and write to the output file.
{
  echo "=== Hardware Information Report ==="
  echo "Date: $(date)"
  echo "==================================="
  
  echo -e "\n--- CPU Information ---"
  lscpu

  echo -e "\n--- Memory Information ---"
  free -h
  echo
  cat /proc/meminfo

  echo -e "\n--- Disk Information ---"
  lsblk
  echo
  df -h

  echo -e "\n--- PCI Devices ---"
  lspci

  echo -e "\n--- USB Devices ---"
  lsusb

  echo -e "\n--- Network Interfaces ---"
  ip addr
  echo
  ip link

  echo -e "\n--- Kernel Information ---"
  uname -a

  echo -e "\n--- Loaded Kernel Modules ---"
  lsmod

  echo -e "\n--- DMI/BIOS Information ---"
  cat /sys/class/dmi/id/sys_vendor 2>/dev/null || echo "System vendor: N/A"
  cat /sys/class/dmi/id/product_name 2>/dev/null || echo "Product name: N/A"
  cat /sys/class/dmi/id/bios_version 2>/dev/null || echo "BIOS version: N/A"
  cat /sys/class/dmi/id/chassis_type 2>/dev/null || echo "Chassis type: N/A"

  echo -e "\n--- Block Devices ---"
  lsblk -o NAME,MAJ:MIN,RM,SIZE,RO,TYPE,MOUNTPOINT

  echo -e "\n--- System Uptime ---"
  uptime

} > "$OUTPUT_FILE"

# Notify the user of the saved file.
echo "Hardware information saved to ${OUTPUT_FILE}"

