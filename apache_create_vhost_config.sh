#!/bin/bash

VHOST=$1;
APACHE_CONFIG_SITE_AVAILABLE="/etc/apache2/sites-available";

SERVER_ADMIN="webmaster@localhost";
VHOSTS="/var/www/vhosts";
DOCUMENT_ROOT="$VHOSTS/$VHOST/htdocs";
LOG_ROOT="$VHOSTS/$VHOST/logs"

create_vhost_config () {

echo "<VirtualHost *:80>";
echo "ServerAdmin $SERVER_ADMIN";

echo "ServerName $VHOST";

echo "DocumentRoot $DOCUMENT_ROOT";

echo "        <Directory $DOCUMENT_ROOT>";
echo "                Options Indexes FollowSymLinks MultiViews";
echo "                AllowOverride All";
echo "                Order allow,deny";
echo "                allow from all"
echo "        </Directory>";

echo "        ErrorLog $LOG_ROOT/error.log";

echo "        # Possible values include: debug, info, notice, warn, error, crit,";
echo "        # alert, emerg.";
echo "        LogLevel warn";

echo "        CustomLog $LOG_ROOT/access.log combined";
echo "</VirtualHost>";
}

if [ ! -n "$VHOST" ];
then
    echo "Required: VHOST name ";
    exit 1;
fi


if [ ! -f $APACHE_CONFIG_SITE_AVAILABLE/$VHOST ];
then
create_vhost_config >> $APACHE_CONFIG_SITE_AVAILABLE/$VHOST;
else
    echo "$VHOST File exists, rename or remove it and try again."
fi

