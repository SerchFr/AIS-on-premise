#!/bin/bash
set -e

echo "Attente du serveur OpenLDAP..."

until nc -z openldap 3890; do
    echo "OpenLDAP n'est pas encore disponible..."
    sleep 2
done

echo "OpenLDAP est accessible."

mkdir -p /run/nslcd
chown nslcd:nslcd /run/nslcd

mkdir -p /srv/share
chmod 0770 /srv/share

echo "Démarrage de nslcd..."
nslcd

sleep 2

echo "Test de la configuration Samba..."
testparm -s

echo "Démarrage de Samba..."
exec smbd --foreground --no-process-group
