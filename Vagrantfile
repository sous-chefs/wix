Vagrant.configure('2') do |config|
  config.vm.box = 'vagrant-windows2008r2'
  config.vm.box_url = 'http://vagrantboxes.hq.daptiv.com/vagrant/boxes/vagrant-windows2008r2.box'
  config.vm.provider :vmware_fusion do |v, override|
    override.vm.box = 'vagrant-vmware-windows2008r2sp1'
    override.vm.box_url = 'http://vagrantboxes.hq.daptiv.com/vagrant/boxes/vagrant-vmware-windows2008r2sp1.box'
    v.gui = true
  end
  config.vm.provider :virtualbox do |v, override|
  	v.gui = true
  end
  config.vm.communicator = :winrm
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe 'windows::reboot_handler'
    chef.add_recipe 'dotnetframework'
  end
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe 'wix::installer'
    chef.add_recipe 'minitest-handler'
  end
end
