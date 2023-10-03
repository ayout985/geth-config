 #use iptables to only allow certain ports
 sudo apt install iptables-persistent
 sudo iptables -P INPUT DROP
 sudo iptables -A INPUT -p tcp -s 192.168.1.68 --dport 22 -j ACCEPT
 iptables-save > /etc/iptables/rules.v4
 
