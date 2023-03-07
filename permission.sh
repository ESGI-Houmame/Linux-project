#!/bin/sh
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
