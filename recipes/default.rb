#
# Cookbook Name:: mimis-cookbook
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

group node['mimis-cookbook']['group']

user node['mimis-cookbook']['user'] do
	group node['mimis-cookbook']['group']
	system true
	shell '/bin/zsh'
end

include_recipe 'apt::default'
# Change the nginx repo to get the latest
apt_repository 'nginx' do
  uri          'http://nginx.org/packages/ubuntu/'
  components   ['raring', 'nginx']
  keyserver    'keyserver.ubuntu.com'
  key          'ABF5BD827BD9BF62'
end

include_recipe 'nginx'

nginx_site 'default' do
	enable false
end

nginx_site node['mimis-cookbook']['site_name'] do
	cookbook 'nginx'
	server_name 'example.com'
	docroot "/#{node['mimis-cookbook']['site_name']}"
end

include_recipe 'oh-my-zsh'

include_recipe 'rvm::user_install'
rvm_ruby 'ruby-2.0.0-p451' do
	user 'vagrant'
	ruby_string 'ruby-2.0.0-p451'
end
rvm_gemset 'ruby-2.0.0-p451@mimisbrunnr'
include_recipe 'postgresql::server'
include_recipe 'database::postgresql'
postgresql_database_user node['mimis-cookbook']['user'] do
	connection node['mimis-cookbook']['psql_connection_info']
	password 'hoddmimisholt'
	action	:create
end
postgresql_database node['mimis-cookbook']['site_name'] do
	connection node['mimis-cookbook']['psql_connection_info']
	action :create
end
