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

# On crée le dossier development
mkdir /development
# On crée le fichier index.html
touch /development/index.html

# On crée le fichier index.css
touch /development/index.css


# On accède au dossier development
cd /development

# L'utilisateur developer1 devient propriétaire du fichier index.html
chown developer1 ./index.html

# Le groupe developpers devient propriétaire du fichier index.html
chgrp developpers ./index.html

# On met les permission OWN : TOUT, GROUPE : LIRE - EXECUTER, PUBLIC: LIRE
chmod 754 ./index.html

# L'utilisateur integrator1 devient propriétaire du fichier index.css
chown integrator1 ./index.css

# Le groupe web devient propriétaire du fichier index.css
chgrp web ./index.css

# On met les permission OWN : TOUT, GROUPE : LIRE - EXECUTER, PUBLIC: AUCUNE
chmod 750 ./index.css
