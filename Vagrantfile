# -*- mode: ruby -*-
# vi: set ft=ruby sw=2 ts=2 :

ENV["TERM"] = "xterm-256color"
ENV["LC_ALL"] = "en_US.UTF-8"

Vagrant.configure("2") do |config|
  config.vm.box = "fedora/26-cloud-base"

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end
  config.vm.provider :libvirt do |v|
    v.cpus = 2
    v.memory = 4096
  end
  config.vm.provider :virtualbox do |v|
    v.check_guest_additions = false
    v.functional_vboxsf = false
    v.customize ["modifyvm", :id, "--memory", "4096"]
    v.customize ["modifyvm", :id, "--cpus", "2"]
  end

  config.vm.provision "shell", privileged: true,  inline: "dnf install -y git go"
  config.vm.provision "shell", inline: "mkdir -p /home/vagrant/go ; chown -R vagrant:vagrant /home/vagrant/go"

  config.vm.provision "shell", privileged: true, inline: "curl -sL 'https://api.bintray.com/content/habitat/stable/linux/x86_64/hab-%24latest-x86_64-linux.tar.gz?bt_package=hab-x86_64-linux' | tar xvzf - -C /usr/local/bin --strip=1
"

  config.vm.synced_folder ".", "/src", type: "rsync"
  config.vm.synced_folder "~/.hab/cache/keys", "/hab/cache/keys", type: "rsync"
  config.vm.synced_folder "~/.hab/etc", "/hab/etc", type: "rsync"
end
