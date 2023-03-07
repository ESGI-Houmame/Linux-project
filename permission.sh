#!/bin/sh
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
