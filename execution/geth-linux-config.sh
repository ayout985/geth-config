 #use iptables to only allow certain ports
rm /etc/iptables/rules.v4

iptables -P INPUT DROP

#accept traffic on loopback
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT

#allow established and related incoming connections
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

#allow established outgoing connections
sudo iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT

sudo iptables -A INPUT -p tcp -s 192.168.1.83 --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT

iptables-save > /etc/iptables/rules.v4

reboot -h now