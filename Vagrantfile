# -*- mode: ruby -*-
# vi: set ft=ruby  :

Vagrant.configure("2") do |config|
{
  'controller' => {
    :box => 'centos/7'
  },
  'target1' => {
    :box => 'centos/7'
  },
  'target2' => {
    :box => 'centos/7'
  }
}.each do |name, conf|
    config.vm.define name do |machine|
      machine.vm.box = conf[:box]
      machine.vm.hostname = name
      machine.vm.network :public_network, :dev => 'br10', :type => 'bridge'

      machine.vm.provider "libvirt" do |lv|
        lv.memory = 1024
        lv.cpus = 1
      end
      if name == "controller"
        machine.vm.provision "shell", path: "./scripts/setup.sh"
        machine.vm.provision "shell", path: "./scripts/ansible_install.sh"
        machine.vm.provision "shell", path: "./scripts/hosts.sh"
      end
      if name == "target1" || name == "target2"
        machine.vm.provision "shell", path: "./scripts/setup.sh"
      end
    end
  end
end
