#!/bin/bash

if [ -e /init/1 ]; then echo "Already initialized"; else 

cd /var/www/html/magento2 

php bin/magento setup:install --base-url=http://localhost \
--db-host=mysql --db-name=magentodb --db-user=magento --db-password=123456 \
--admin-firstname=Admin --admin-lastname=Admin --admin-email=user@example.com \
--admin-user=admin --admin-password=admin123 --language=en_US \
 --use-rewrites=1 \
--search-engine=elasticsearch7 --elasticsearch-host=elasticsearch \
--elasticsearch-port=9200 

composer install && php bin/magento setup:upgrade && php bin/magento indexer:reindex && php bin/magento cache:flush

php -f ./magento2-sample-data/dev/tools/build-sample-data.php -- --ce-source=/var/www/html/magento2

bin/magento setup:upgrade

chown -R www-data:www-data /var/www/html/magento2/
chmod -R 777 /var/www/html/magento2/

touch /init/1
fi

php-fpm
