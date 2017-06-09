#!/bin/bash

echo "BIENVENUE SUR MON PROJET SYS"
echo "CHOISIR L'OPTION A EXECUTER"
echo " a- les informations sur les utilisateurs enregistrer il ya 3 jours"
echo " b - aquisition et installation de xampp "
echo " c - archivage des elements du rep perso modifier par le sudoer il ya 2 jours"
echo " d - infos d'utilisation du disque,memoire,disque,processus,swap  "
echo " *- quitter(Q/q) "
echo 						" YOUSSOUFOU HAMADOU "
echo 						" Matricule: 14A793 FS"

read -r choix
#if [ $choix == 'a' ]; then
#	echo "le choix est a"
#fi
case $choix in 
	#liste des utilisateurs 
	'a') cut -d : -f 1 /etc/passwd>tt
	sleep 5
	ls /home>fil
	sleep 5
	while read line 
	do
		while read line1
		do	
		if [ $line == $line1 ] ; then 
		echo $line1>user1
		fi
		done<fil
	done<tt
	find /home/* -type d -ctime 3 -print>userx

	while read line1
	do
	   while read user
	   do 
	      if [ $line1 == '/home/'$user ] ; then
		echo " $user a ete cree il ya 3jour">3jours_utilasateur.txt
	      fi

	  done<user1 
	done<userx
	
 ;;
	'b') echo " xampp Acquisition"
	 wget https://downloadsapachefriends.global.ssl.fastly.net/xampp-files/5.6.30/xampp-linux-x64-5.6.30-1-installer.run?from_af=true
	 echo " insatllation "
	 ./xampp-linux-x64-5.6.30-1-installer.run
	echo "demarage des service  entrez votre password"
	 sudo su
	#arret du service apache 
	service apache2 stop
	#arret du service ftp
	service proftpd stop
	#demarage de xampp
	/opt/lampp/lampp start


;;
	'c') echo "archivave";;
	#archivage des elements du rep perso modifier par le sudoer il ya 2 jours
	mkdir -p /home/ushi-deshi/archive
	find /home/ushi-deshi/ -type f -mtime 2 -print>/home/ushi-deshi/ficmodi
	while read line
	do
	cp $line archive
	done </home/ushi-deshi/ficmodi
	tar -czvf archive.tar.gz archive
	#mv archive.tar.gz /media/usb/*/archive.tar.gz
	mv archive.tar.gz /home/ushi-deshi/prof/archive.tar.gz
	;;

	'd') echo "les informations sur l'utilisation du disque :"
		df -h |grep /dev/sd
		echo "les informations sur l'utilisation de la memoire et de la swap :"
		free -h
;;
	*)  exit 1 ;;
esac


