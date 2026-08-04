#!/bin/bash

mkdir -p /srv/samba/public

chmod 777 /srv/samba/public

exec smbd --foreground --no-process-group
