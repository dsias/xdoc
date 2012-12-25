#!/bin/bash

VHOSTS="/var/www/vhosts";
VHOST=$1;

DEFAULT_HTML="<?php phpinfo(); ?>";


mkdir -p $VHOSTS;


create_vhost () {

VHOST=$1;

mkdir -p $VHOSTS/$VHOST;
mkdir -p $VHOSTS/$VHOST/htdocs;
mkdir -p $VHOSTS/$VHOST/htsdocs;
mkdir -p $VHOSTS/$VHOST/private;
mkdir -p $VHOSTS/$VHOST/logs;
mkdir -p $VHOSTS/$VHOST/stats;
echo $DEFAULT_HTML > $VHOSTS/$VHOST/htdocs/index.php;
echo "VHOST $VHOST created";
}

if [ -n "$VHOST" ]; then
    echo "CREATING VHOST $VHOST";
    create_vhost $VHOST;
    ./apache_create_vhost_config.sh $VHOST;
fi

# call create_vhost function direct
#create_vhost default
#create_vhost admin	
#create_vhost webmail

