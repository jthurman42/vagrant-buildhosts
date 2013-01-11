# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # Start them with a gui window
  config.vm.boot_mode = :gui

  #
  # Targets
  #
  config.vm.define :centos5 do |target_config|
    target_config.vm.box     = "centos-5.6-x86_64-netinstall-4.1.6"
    target_config.vm.box_url = "http://dl.dropbox.com/u/9227672/#{target_config.vm.box}.box"

    target_config.vm.provision :shell, :inline => '/vagrant/setup.sh'

    target_config.vm.host_name = 'buildhost-centos5'
    target_config.vm.network :hostonly, "192.168.50.5"
  end

  config.vm.define :centos6 do |target_config|
#    target_config.vm.box     = "CentOS-6-x86_64-buildhost-2012121701"
    target_config.vm.box     = "CentOS-6.3-x86_64-minimal"
    target_config.vm.box_url = "https://dl.dropbox.com/u/7225008/Vagrant/#{target_config.vm.box}.box"

    target_config.vm.provision :shell, :inline => '/vagrant/setup.sh'

    target_config.vm.host_name = 'buildhost-centos6'
    target_config.vm.network :hostonly, "192.168.50.6"
  end
end

