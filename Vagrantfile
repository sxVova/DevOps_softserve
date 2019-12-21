# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
config.vm.box = "lamptest"

config.ssh.username = "vagrant"

config.ssh.password = "vagrant"

config.vm.define "lamp" do|lamp|

lamp.vm.hostname = "lamp" 

lamp.vm.network "private_network", ip: "192.168.205.10" 

lamp.vm.provision :shell, path: "script.sh" 

end

end
