# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "deb/jessie-amd64"

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end
  
  config.vm.network "forwarded_port", guest: 2375, host: 2376, host_ip: "127.0.0.1", id: "docker"

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y curl
    rm -rf /var/lib/apt/lists/*

    # Mono - not currently required...
    # apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

    # echo "deb http://download.mono-project.com/repo/debian wheezy/snapshots/3.12.0 main" > /etc/apt/sources.list.d/mono-xamarin.list
    # echo "deb http://ftp.debian.org/debian testing main"     >  /etc/apt/sources.list.d/debian-testing
    # echo "deb-src http://ftp.debian.org/debian testing main" >> /etc/apt/sources.list.d/debian-testing

    # apt-get update
    # DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes mono-devel ca-certificates-mono fsharp mono-vbnc nuget docker.io
    DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes docker.io
    # rm -rf /var/lib/apt/lists/*

    # sudo-less docker
    sudo groupadd docker
    sudo gpasswd -a vagrant docker
    sudo service docker restart
   SHELL
end
