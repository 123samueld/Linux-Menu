+#!/bin/bash
x=0
while [ $x = 0 ]
do 
	clear
	echo "Options"
	echo "1 - Backupfile"
	echo "2 - Create datestamped log file"
	echo "3 - Copy a file"
	echo "4 - Move a file"
	echo "5 - Exit"
	read option
	case $option in
	1) 
	DATE=`date +%d_%m_%y`
	if test -f_*;
	then
	cp menu menu_backup_$DATE
	echo "Backup correctly"
	sleep 2
	else
	echo "Not backed up correctly"
	sleep 2
	fi
	;;
	2) 
	mkdir log_dir
	cd log_dir
	touch log_file
	NAME=log_file
	DATE=`date +%d_%m_%y`
	DATESTAMPED=${NAME}_${DATE}
	echo "Log file created under the name "$DATESTAMPED
	chmod 755 $DATESTAMPED
	echo "Login: $(whoami)" > $DATESTAMPED
	echo "Directory: $(hostname)" >> $DATESTAMPED
	echo "Shell: "$SHELL >> $DATESTAMPED
	echo "On since: $(uptime)" >> $DATESTAMPED
	sleep 3
	;;
	3)
	echo "Choose your file to copy"
	read -r file
	if [ -f $file ] ;
		then
		echo "Choose the name of the  new file"
		read -r file_name
		echo "Choose destination for the copy"
		read -r destination
		if [ -d $destination ] ;
			then
			cp ./"$file" "$destination"/"$file_name"
			echo  "File copied to new location"
			sleep 2
		fi
		else 
		echo "File not found"
		sleep 2
	fi
	;;
	4)
	echo "Choose a file to move"
	read -r file
	if [ -f $file ];
		then 
		echo "Choose a target destination"
		read -r destination
		if [ -d $destination ];
		then
			mv $file $destination 
			echo "File has been moved"
			sleep 2
		else
			echo "Destination not found"
			sleep 2
		fi
	else
		echo "File not found"
		sleep 20
	fi
	;;
	5)
	 echo "Exiting the program in "
	echo "3"
	sleep 1
	echo "2"
	sleep 1
	echo "1"
	sleep 1
	x=1
	;;
	*) echo "Sorry that's not an option, please try again."
	esac
done
