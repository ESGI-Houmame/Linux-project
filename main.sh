#!/bin/sh
groupadd developers
groupadd docker
groupadd web
groupadd figma
groupadd marketing
groupadd ads

useradd -r -c "software engineer" -m -d /engineers/developer1 -e 2050-01-01 -g developers,docker -u 1000 -p mdpDev1 Developpeur1
useradd -r -c "software engineer" -m -d /engineers/developer2 -e 2050-01-02 -g developers,docker -u 1001 -p mdpDev2 Developpeur2
useradd -r -c "integrator" -m -d /web/integrator1 -e 2060-02-01 -g web,figma -u 2000 -p mdpInt1 Integrateur1
useradd -r -c "integrator" -m -d /web/integrator2 -e 2060-02-02 -g web,figma -u 2001 -p mdpInt2 Integrateur2
useradd -r -c "growthhacker" -m -d /marketing/growthhacker1 -e 3000-03-01 -g marketing,ads -u 3000 -p mdpGrowHack1 GrowthHacker1

mkdir /development
touch /development/index.html
touch /development/index.css

cd /development
chown developer1 ./index.html
chgrp developpers ./index.html
chmod 754 ./index.html

chown integrator1 ./index.css
chgrp web ./index.css
chmod 750 ./index.css
