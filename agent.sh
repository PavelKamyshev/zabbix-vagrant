echo "Adding repos..."
wget http://repo.zabbix.com/zabbix/3.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.2-1+trusty_all.deb
dpkg -i 'zabbix-release_3.2-1+trusty_all.deb'
apt-get -y update
export DEBIAN_FRONTEND=noninteractive
echo "Done."

echo "Installing zabbix-agent..."
apt-get install -y zabbix-agent &>/dev/null
sed -i "s/Server=127.0.0.1/Server=kamyshevzabbix/" /etc/zabbix/zabbix_agentd.conf
echo "Done."


echo "Starting zabbix-agent..."
service zabbix-agent start
echo "Started."

echo "======Agent node is ready======"