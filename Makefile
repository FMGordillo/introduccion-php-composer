PORT?=8082

start:
	docker build -t fmgordillo/apache-php .
	docker run --name apache-php -d -p $(PORT):80 --mount type=bind,source="$(CURDIR)/htdocs",target=/var/www/html fmgordillo/apache-php

stop:
	docker stop apache-php
	docker rm apache-php

logs:
	docker container logs apache-php

login:
	docker exec -it apache-php bash

status:
	docker ps -f name=apache-php
