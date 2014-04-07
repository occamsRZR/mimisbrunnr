default['mimis-cookbook']['user'] = 'mimir'
default['mimis-cookbook']['group'] = 'aesir'
default['mimis-cookbook']['site_name'] = 'mimisbrunnr'
default['mimis-cookbook']['group'] = 'aesir'
default['nginx']['enable_default_site'] = false
default['oh_my_zsh'][:users] = [{
	login: 'vagrant',
	theme: 'bira',
	plugins: ['gem', 'git', 'rails', 'redis-cli', 'rvm']
}]
default['mimis-cookbook']['psql_connection_info'] = {
	host: 'localhost',
	username: 'postgres',
	password: 'toor'
}