groupadd developers
groupadd docker
groupadd web
groupadd figma
groupadd marketing
groupadd ads

useradd -r -c Dev1 -m -d /engineers/developer1 -e 2050-01-01 -g developers,docker -u 1000 -p mdpdev1 Developpeur1
useradd -r -c Dev2 -m -d /engineers/developer2 -e 2050-01-02 -g developers,docker -u 1001 -p mdpdev2 Developpeur2
useradd -r -c Int1 -m -d /web/integrator1 -e 2060-02-01 -g web,figma -u 2000 -p mdpint1 Integrateur1
useradd -r -c Int2 -m -d /web/integrator2 -e 2060-02-02 -g web,figma -u 2001 -p mdpint2 Integrateur2
useradd -r -c GrowHack1 -m -d /marketing/growthhacker -e 3000-03-01 -g marketing,ads -u 3000 -p mdpGrowHack1 GrowthHacker