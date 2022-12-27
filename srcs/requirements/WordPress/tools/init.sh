#!/bin/sh
if ! wp db check --allow-root --path=/var/www/wordpress ; then
echo "Database is down! Restarting wordpress container..." >&2
exit 1
fi
if ! wp core is-installed --allow-root --path=/var/www/wordpress ; then
wp core install --allow-root --url=https://$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_LOGIN \
                                --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_MAIL
wp user create --allow-root $WP_USER_LOGIN $WP_USER_MAIL --user_pass=$WP_USER_PASS
wp theme activate --allow-root twentytwentytwo
fi
echo "Wordpress is starting... URL: https://$DOMAIN_NAME | User's credentials -> login: $WP_USER_LOGIN | password: $WP_USER_PASS"
php-fpm7.3 -F
