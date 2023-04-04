Vagrant.configure("2") do |config|
  config.vm.boot_timeout = 300
  config.vm.synced_folder "./site/", "/home/vagrant/"
  config.vm.provider "virtualbox" do |v|
  
end
  config.vm.define "web1" do |web1|
    web1.vm.box = "ubuntu/focal64"
    #web1.vm.network "forwarded_port", guest: 80, host: 8080
    web1.vm.network "private_network", ip: "192.168.56.10"
    #web1.vm.synced_folder "./site/site1.html","/home/vagrant/"
    web1.vm.provision "shell", path: "web.sh"
    web1.vm.provision "shell",inline:<<-SHELL
      sudo mv /home/vagrant/site1.html /var/www/html/index.nginx-debian.html
    SHELL
    
  end

  config.vm.define "web2" do |web2|
    web2.vm.box = "ubuntu/focal64"
    #web2.vm.network "forwarded_port", guest: 80, host: 8081
    web2.vm.network "private_network", ip: "192.168.56.11"
    web2.vm.provision "shell", path: "web.sh"
    web2.vm.provision "shell",inline:<<-SHELL
    sudo mv /home/vagrant/site2.html /var/www/html/index.nginx-debian.html
    SHELL
    
  end


config.vm.define "haproxy" do |haproxy|
  haproxy.vm.box = "ubuntu/focal64"
  haproxy.vm.network "forwarded_port", guest: 80, host: 8090
  haproxy.vm.network "private_network", ip: "192.168.56.20"
  haproxy.vm.provision "shell", path: "HAProxy.sh"
end
end