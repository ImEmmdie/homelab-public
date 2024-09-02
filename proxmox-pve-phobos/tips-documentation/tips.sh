#Tips and command to remember


#DISKS allocate all disk space (of the main 1 disk ) to one storage pool
	lvremove /dev/pve/data
	lvresize -l +100%FREE /dev/pve/root
	resize2fs /dev/mapper/pve-root

#########################################################################################################
#########################################################################################################


#LAPTOP For laptop-nodes/servers change sleep state when the lid is closed
	nano /etc/systemd/logind.conf
		
		#-->Change these 2 lines to ignore 
			HandleLidSwitch=ignore
			HandleLidSwitchDocked=ignore

#########################################################################################################
#########################################################################################################


#CT Update container image (unlock more turnkey linux )	
	pveam update

#########################################################################################################
#########################################################################################################


#copy files from remote server to local machine ;
	scp -P 22 <USER@IP>:<path-for-the-file-to-copy> ~/dev/backup

#example
	scp -P 22 root@192.168.1.153:/opt/Tautulli/backups/config.backup-20240826172655.ini ~/dev/backup

#copy dirrectory from remote server to local machine ;
	scp -P 22 -R < USER@IP>:<path-for-the-dirrectory-to-copy > ~/dev/backup

#example
	scp -P 22 -R root@192.168.1.153:/opt/Tautulli/backups ~/dev/backup

