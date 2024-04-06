#!/bin/bash
me=$(whoami) 

echo
echo
echo " ____ _    ____ _    ____ ____ _   " 
echo "/ ___/ \ //  _ / \ //  __/  _ / \ |\"
echo "|    | |_|| / \| | ||  \/| / \| | //"
echo "\___ | | || \_/| \_/|    | |-|| \// "
echo "\____\_/ \\____\____\_/\_\_/ \\__/  "
                                                                 
echo
echo
cd
echo "This Is Made by DeShoha"
echo "Contract:-->idoneoone@gmail.com"
echo
sleep 5
echo "This is For TP-Link TL-Wn722N"

echo "Driver Name Of TP-Link TL-WN722N is 8188eu"
echo
echo "Please Connect your Wifi Adapter, $me! !"
echo

echo "Do You Wish To Contineu,$me?"
echo "Yes[y] or No[n]"
read option
echo
echo
if [[  $option == "y" || $option == "yes" || $option == "YES" || $option == "Yes"  ]]; then
	echo "need Root Access"
	
	#[ "$UID" -eq 0 ] || exec sudo "$0" "$@"
	
	#if [ "$(id -nu)" != "root" ]; then
		#sudo -k
		#pass=$(whiptail --backtitle "Geting Root Access" --title "Authentication Required" --passwordbox "Installing This Requires Administrative privilege. Please authenticate to being  the installation.\n\n[sudo] Password for user $me:" 12 50 3>&2 2>&1 1>&3- )
		#exec sudo -S -p '' "$0" "$@" <<< "$pass"
		
	#fi
	echo
	#echo "Running=--> sudo apt install bc && y"
	echo "Geting root access"
	sudo apt install bc && y
	echo "Running=--> sudo apt install bc && y"
	echo
	echo "Running=--> sudo rmmod r8188eu.ko"
	sudo rmmod r8188eu.ko
	echo "Running=--> sudo apt install git && y"
	sudo apt install git && y
	echo
	echo "Running=--> git clone https://github.com/aircrack-ng/rtl8188eus"
	echo
	git clone https://github.com/aircrack-ng/rtl8188eus
	sudo echo "Running=--> echo "blacklist r8188eu.ko" > "/etc/modprobe.d/realtek.conf" "
	echo "blacklist r8188eu.ko" > "/etc/modprobe.d/realtek.conf"
	echo "Changing Directory"
	sleep 4
	cd rtl8188eus/
	echo "Done"
	sleep 2
	sudo make
	echo
	echo "wait 10 sec"
	echo "If Not working Pleses Check that you have rigth virtion of kali linux"
	sleep 10
	echo 
	echo "Running=--> make install"
	sudo make install
	echo
	echo "Changing Directory"
	cd 
	echo
	sleep 2
	echo "Running=--> sudo modprobe 8188eu"
	sleep 1
	sudo modprobe 8188eu
	echo "wait 14 sec"
	sleep 14
	echo "Installation Complete"
	echo
	echo
	echo "Do You wish to check monitor modee on your wifi adapture?"
	echo "yes[y] or No[n]"
	sleep 5
	read choi
	if [[ $choi == "y" || $choi == "yes" ]]; then
		echo
		echo
		#sudo apt install airmon-ng && y
		sudo airmon-ng
		echo
		echo "Enter wlan name of your Adapter"
		read ad
		echo
		sudo ip link set $ad down
		sudo iw dev $ad set type monitor
		sudo airmon-ng
		#sudo apt-get install airodump-ng && y
		sudo airodump-ng start $ad
		echo
		sleep 5
		echo "having problem start $ad or internet not connecting ?"
		echo "yes[y] or no{n]"
		read ip
		echo
		if [[ $ip == "y" || $ip == "yes" ]]; then
			echo "Running :--> sudo systemctl start NetworkManager "
			sudo systemctl start NetworkManager
			sleep 6
			echo
			echo "Look Now may Be Your Wifi Is back"
			echo
		elif [[ $ip == "n" || $ip == "no" ]]; then
			echo "you have Slected NO"
			echo
			sleep 2
		else
			echo 
			echo "Quiting"
			sleep 2
		fi
	elif [[ $choi == "n" || $choi == "no" ]]; then
		echo 
		echo "You Have Slected No"
		sleep 2
	else
		echo "Ok Not Installing"
		sleep 2
	fi
	
#else 
	#echo "Exiting"
#fi
elif [[ $option == "n" || $option == "no" ]]; then
	echo 
	echo 
	echo "You have slected NO, $me ! !"
	echo "Exiting"
	sleep 2
else 
	echo "quiting"
	sleep 2
fi
