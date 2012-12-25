#!/bin/bash

VHOSTS="/var/www/vhosts"

mkdir -p $VHOSTS

VHOST="default"
mkdir -p $VHOSTS/$VHOST
mkdir -p $VHOSTS/$VHOST/htdocs
mkdir -p $VHOSTS/$VHOST/htsdocs
mkdir -p $VHOSTS/$VHOST/private
mkdir -p $VHOSTS/$VHOST/logs
mkdir -p $VHOSTS/$VHOST/stats


VHOST="admin"
mkdir -p $VHOSTS/$VHOST
mkdir -p $VHOSTS/$VHOST/htdocs
mkdir -p $VHOSTS/$VHOST/htsdocs
mkdir -p $VHOSTS/$VHOST/private
mkdir -p $VHOSTS/$VHOST/logs
mkdir -p $VHOSTS/$VHOST/stats


