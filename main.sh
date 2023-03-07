groupadd developers
groupadd docker
groupadd web
groupadd figma
groupadd marketing
groupadd ads

useradd -r -c "software engineer" -m -d /engineers/developer1 -e 2050-01-01 -g developers,docker -u 1000 -p $(head /dev/urandom | tr -dc A-Za-z0-9 | fold -w 8 | head -n 1) Developpeur1
useradd -r -c "software engineer" -m -d /engineers/developer2 -e 2050-01-02 -g developers,docker -u 1001 -p $(head /dev/urandom | tr -dc A-Za-z0-9 | fold -w 8 | head -n 1) Developpeur2
useradd -r -c "integrator" -m -d /web/integrator1 -e 2060-02-01 -g web,figma -u 2000 -p $(head /dev/urandom | tr -dc A-Za-z0-9 | fold -w 8 | head -n 1) Integrateur1
useradd -r -c "integrator" -m -d /web/integrator2 -e 2060-02-02 -g web,figma -u 2001 -p $(head /dev/urandom | tr -dc A-Za-z0-9 | fold -w 8 | head -n 1) Integrateur2
useradd -r -c "growthhacker" -m -d /marketing/growthhacker1 -e 3000-03-01 -g marketing,ads -u 3000 -p $(head /dev/urandom | tr -dc A-Za-z0-9 | fold -w 8 | head -n 1) GrowthHacker1