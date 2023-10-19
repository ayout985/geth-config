 #use iptables to only allow certain ports
sudo iptables -P INPUT DROP
sudo iptables -A INPUT -p tcp -s 192.168.1.68 --dport 22 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 30303 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport 30303 -j ACCEPT
sudo iptables -A INPUT -p udp --dport 30303 -j ACCEPT
sudo iptables -A OUTPUT -p udp --dport 30303 -j ACCEPT
iptables-save > /etc/iptables/rules.v4
