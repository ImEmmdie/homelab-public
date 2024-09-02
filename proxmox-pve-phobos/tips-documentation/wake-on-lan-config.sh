

#update and install if not already installed ethtool
apt-get update && apt-get install ethtool

#see state of the network interface you want to add WoL
ethtool enp2s0

#shows something like this : Supports Wake-on: pumbg
#	                         Wake-on: d

#enable wake on lan 
ethtool -s enp2s0 wol g

#add on network interfaces wake on lan 
nano /etc/network/interfaces

#Add at the end :
post-up /usr/sbin/ethtool -s enp2s0 wol g
post-down /usr/sbin/ethtool -s enp2s0 wol g

#create systemd service so that the wake on lan is persistant

nano /etc/systemd/system/wol.service

        [Unit]
        Description=Wake-on-LAN for enp2s0 
        Requires=network.target
        After=network.target

        [Service]
        ExecStart=/usr/sbin/ethtool -s enp2s0 wol g
        ExecStop=/usr/sbin/ethtool -s enp2s0 wol g

        [Install]
        WantedBy=multi-user.target

#start the service , enable it and reload systemctl daemon

systemctl start wol.service
systemctl enable wol.service
systemctl is-enabled wol.service
systemctl daemon-reload

#end