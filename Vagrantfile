# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

Vagrant.configure("2") do |config|

  config.vm.box = "debian/jessie64"

  cluster_config = YAML.load_file("config/config.yaml")
  base_ip = cluster_config['ip_format']
  vm_id = 0

  cluster_config['num_of_masters'].times do |n|
    config.vm.define "master#{n+1}" do |server|
      server.vm.hostname = "master#{n+1}"
      server.vm.network "private_network", ip: (base_ip % (vm_id+=1))
    end
  end

  cluster_config['num_of_slaves'].times do |n|
    config.vm.define "slave#{n+1}" do |server|
      server.vm.hostname = "slave#{n+1}"
      server.vm.network "private_network", ip: (base_ip % (vm_id+=1))
    end
  end

	config.vm.provider "virtualbox" do |vm|
		vm.memory = "1024"
	end
end
