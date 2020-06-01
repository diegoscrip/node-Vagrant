Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.define "db" do |db|
    db.vm.network "private_network", ip: "192.168.99.2"
    db.vm.provision "file", source: "source/script", destination: "/home/vagrant"
    db.vm.provision "shell", path: "provision/db-provision.sh"
  end

  config.vm.define "web" do |web|
    web.vm.network "forwarded_port", guest: 8081, host:1234, guest_ip: "192.168.99.1"
    web.vm.network "private_network", ip: "192.168.99.1"
    web.vm.provision "file", source: "source/app-node", destination: "/home/vagrant/app-node"
    web.vm.provision "shell", path: "provision/web-provision.sh"
  end
end
