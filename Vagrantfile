# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "ansible" do |ansible|
    ansible.vm.box = "bprice/oracle7"
    ansible.vm.hostname = "control-node"
    ansible.vm.network "private_network", ip: "192.168.5.165"
    
    ansible.vm.provision "ansible_local" do |ansible|
      ansible.playbook           = "ansible/playbooks/provision-control-node.yml"
      ansible.compatibility_mode =  "2.0"
    end

    ansible.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 512]
      v.customize ["modifyvm", :id, "--name", "Control Node"]
    end
  end

end
