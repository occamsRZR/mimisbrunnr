name             'mimis-cookbook'
maintainer       'Brandon Fulk'
maintainer_email 'brandon.fulk@gmail.com'
license          'All rights reserved'
description      'Installs/Configures mimis-cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'nginx', '~> 2.5.0'
depends 'rvm'
depends 'database'
depends 'postgresql'