# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

	config.vm.define "server" do |server|
		server.vm.box = "ubuntu/trusty64"
		server.vm.network "public_network"
		server.vm.hostname = "kamyshevzabbix"
		server.vm.network "forwarded_port", guest: 80, host: 8080
		server.vm.provider "virtualbox" do |vb|
		vb.memory = "1024"
		vb.cpus = "2"
		vb.name = "zabbix-server"
		end
		server.vm.provision "shell", path: "build.sh", privileged: true
	end
	
	
	config.vm.define "agent" do |agent|
		agent.vm.hostname = "zabbix-agent"
		agent.vm.box = "ubuntu/trusty64"
		agent.vm.network "public_network"
		agent.vm.hostname = "kamyshevzabbixagent"
		agent.vm.provision "shell", path: "agent.sh", privileged: true
		agent.vm.provider "virtualbox" do |vb|
		vb.memory = "1024"
		vb.cpus = "1"
		vb.name = "zabbix-agent"
		end
	end
end