#!/bin/bash
# connects the local macos computer to a wifi network.
# Reason to get this script together: Someone needed to set a headless MacMini on WiFi networks when he was on the road.
# The offered solution given was to install rustdesk (https://rustdesk.com) on the MacMini,
# and set it to automatically connect to his phone hotspot. 
# In addition to that, the iPad also needed to have RustDesk, he could be able to connect to the MacMini 
# and set the those on. the road WiFi networks that way.
# This script is an additional option, if manipulating the desktop remotely via the iPad were conversome.
# This script asks for the Wi-Fi Device (example: en0), the Wi-Fi's SSID, and the Wi-Fi's password. 
# Then it proceeds to connect the device (MacMini in this case).  
# Author: Daniel Arauz -Twitter: @danarauz - 2023-03-01
#
clear
   echo "+---------------------------------------------------------------------------------+"
   echo "| WiFi: Connecting a MacOS computer to a Wireless Network                         |"
   echo "+---------------------------------------------------------------------------------+"
   echo " "
   echo "List of hardware ports and their devices:"
   echo "-----------------------------------------"
#rm portList.txt
networksetup -listallhardwareports >> portsList.txt
cat portsList.txt | grep -v "=" | grep -v "VLAN Configurations"
rm portsList.txt
   echo " "
   read -p "Input the Wi-Fi Port Device name (example: en0), then press [ENTER]: " interface
   echo " "
   echo " "
   echo "WiFi Networks Available:"
   echo "------------------------"
/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport scan
   echo " "
   echo " "
   read -p "Input the WiFi SSID to connect to, then press [ENTER]: " routerSSID 
   read -p "Input the WiFi password, then press [ENTER]: " WiFipassword 
   echo "Executing command... "
networksetup -setairportnetwork "$interface" "$routerSSID" "$WiFipassword"
   echo " "
   echo "+---------------------------------------------------------------------------------+"
   echo "Command executed. $(date)"
exit 0
