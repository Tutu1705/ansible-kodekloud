# -*- mode: ruby -*-
# vi: set ft=ruby  :

machines = {
  "controller" => {"memory" => "1024", "cpu" => "1", "image" => "centos/7"}
  "target1" => {"memory" => "1024", "cpu" => "1", "image" => "centos/7"},
  "target2" => {"memory" => "1024", "cpu" => "1", "image" => "centos/7"},
}

Vagrant.configure("2") do |config|

  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}"
      machine.vm.network "public_network", bridge: "wlp1s0"

      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
        vb.customize ["modifyvm", :id, "--groups", "/Ansible-Lab"]
      end
      if "#{name}" == "controller"
        machine.vm.provision "shell", path: "./scripts/setup.sh"
        machine.vm.provision "shell", path: "./scripts/hosts.sh"
      end
      if "#{name}" == "target1" || "#{name}" == "target2"
        machine.vm.provision "shell", inline: "yum update -y"
        machine.vm.provision "shell", path: "./scripts/hosts.sh"
      end
    end
  end
end
