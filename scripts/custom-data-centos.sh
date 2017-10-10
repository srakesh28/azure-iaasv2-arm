#!/bin/sh

mkdir /home/cloud/myapp
cd /home/cloud
cat <<EOT >> cloud-init-centos.txt

#cloud-config
packages:
  - httpd
write_files:
  - owner: cloud:cloud
  - path: /var/www/html/index.html
    content: |
    <html>
	<header><title>This is Hello world title</title></header>
	<body>
	Hello world
	</body>
	</html>
runcmd:
  - service httpd restart
EOT
