docker-compose -f docker-compose.yml up --build -d || exit 1

docker-compose -f docker-compose.yml down
docker-compose -f docker-compose.yml up -d

docker-compose -f docker-compose.yml exec --user root php usermod -u $(id -u) www-data \
&& docker-compose  -f docker-compose.yml exec --user root php groupmod -g $(id -u) www-data || exit 1
docker-compose -f docker-compose.yml exec php composer install || exit 1
