#!/bin/bash
#On crée les groupes des différents utilisateurs par défaut précisés dans le sujet
groupadd developers
groupadd docker
groupadd web
groupadd figma
groupadd marketing
groupadd ads
sleep 5s
#On crée les utilisateurs en question avec un mot de passe random car nous n'avons pas le droit de divulguer ces mots de passe
useradd -r -c "software engineer" -m -d /engineers/developer1 -e 2050-01-01 -G developers,docker -u 1000 -p $(head /dev/urandom | tr -dc A-Za-z0-9 | fold -w 8 | head -n 1) developer1
sleep 1s
useradd -r -c "software engineer" -m -d /engineers/developer2 -e 2050-01-02 -G developers,docker -u 1001 -p $(head /dev/urandom | tr -dc A-Za-z0-9 | fold -w 8 | head -n 1) developer2
sleep 1s
useradd -r -c "integrator" -m -d /web/integrator1 -e 2060-02-01 -G web,figma -u 2000 -p $(head /dev/urandom | tr -dc A-Za-z0-9 | fold -w 8 | head -n 1) integrator1
sleep 1s
useradd -r -c "integrator" -m -d /web/integrator2 -e 2060-02-02 -G web,figma -u 2001 -p $(head /dev/urandom | tr -dc A-Za-z0-9 | fold -w 8 | head -n 1) integrator2
sleep 1s
useradd -r -c "growthhacker" -m -d /marketing/growthhacker1 -e 3000-03-01 -G marketing,ads -u 3000 -p $(head /dev/urandom | tr -dc A-Za-z0-9 | fold -w 8 | head -n 1) growthhacker1


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
chgrp developers ./index.html

# On met les permission OWN : TOUT, GROUPE : LIRE - EXECUTER, PUBLIC: LIRE
chmod 754 ./index.html

# L'utilisateur integrator1 devient propriétaire du fichier index.css
chown integrator1 ./index.css

# Le groupe web devient propriétaire du fichier index.css
chgrp web ./index.css

# On met les permission OWN : TOUT, GROUPE : LIRE - EXECUTER, PUBLIC: AUCUNE
chmod 750 ./index.css
