# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.hostname = "mimis-cookbook-berkshelf"
  config.vm.box = "ubuntu-13.04-vanilla-mimir"
  config.vm.box_url = "http://goo.gl/ceHWg"
  config.omnibus.chef_version = :latest
  config.vm.network :private_network, ip: "33.33.33.10"
  config.vm.boot_timeout = 120
  config.vm.synced_folder '../', '/mimisbrunnr'
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :postgresql => {
        :password => {
          :mimir => 'hoddmimisholt',
          :postgres => 'toor'
        },
        :pg_hba => [{
          :comment => '# Optional comment',
          :type => 'host',
          :db => 'all', 
          :user => 'postgres',
          :addr => '0.0.0.0/0', 
          :method => 'md5'
        },{
          :comment => '# Optional comment',
          :type => 'local',
          :db => 'all', 
          :user => 'all',
          :addr => nil, 
          :method => 'trust'
        },{
          :comment => '# Optional comment',
          :type => 'host',
          :db => 'all', 
          :user => 'all',
          :addr => '127.0.0.1/32', 
          :method => 'trust'
        }]
      }
    }

    chef.run_list = [
        "recipe[mimis-cookbook::default]"
    ]
  end
end
