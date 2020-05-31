# coding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

def vagrant_root_file
  File.dirname(__FILE__)
end

def absolute_path(relative_path)
  vagrant_root_file + '/' + relative_path
end

require absolute_path("user_settings.rb")

Vagrant.configure(2) do |config|
  config.vm.guest = :freebsd

  config.ssh.shell = "sh"
  config.vm.base_mac = "2CF82E9385AE"

  config.vm.hostname = USER_SETTINGS[:hostname]

  config.ssh.insert_key = true
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.boot_timeout = 600

  config.vm.box = "FreeBSD/12.1/ZFS"
  config.vm.box_check_update = false

  config.vm.network :private_network, type: "dhcp", nic_type: "virtio"

  config.vm.network "public_network", bridge: USER_SETTINGS[:bridge], ip: USER_SETTINGS[:ip_address], netmask: USER_SETTINGS[:ip_netmask], nic_type: "virtio"

  config.vm.synced_folder vagrant_root_file, "/vagrant", id: "vagrant-root", type: "rsync",
                          rsync__exclude: [".git/", ".vagrant/", "shared_folder/", "packer/"]

  config.vm.synced_folder absolute_path("shared_folder"), "/home/vagrant/sharing",
                          type: "nfs"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    # vb.gui = true

    vb.customize ["modifyvm", :id, "--memory", "4096"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
    vb.customize ["modifyvm", :id, "--audio", "none"]
    vb.customize ["modifyvm", :id, "--paravirtprovider", "minimal"]
  end

  config.vm.provision "install ansible", type: "shell", inline: "pkg install -qy pkg py37-ansible git"

  config.vm.provision "main provision" , type: "ansible_local" do |ansible|
    ansible.limit = "all"
    ansible.playbook = "provisioning/site.yml"
    ansible.host_vars = {
      "default" => {
        "git_user_name" => USER_SETTINGS[:git_user_name],
        "git_user_email" => USER_SETTINGS[:git_user_email],
        "user_name" => USER_SETTINGS[:user_name]
      }
    }
    ansible.galaxy_roles_path = "provisioning/roles"
    ansible.skip_tags = USER_SETTINGS[:ansible_skip_tags]
    ansible.galaxy_role_file = "provisioning/requirements.yml"
    ansible.compatibility_mode = "2.0"
  end
end
