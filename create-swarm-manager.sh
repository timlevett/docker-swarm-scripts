# this script creates a swarm manager
# documentation here: https://docs.docker.com/engine/swarm/
#

# when running on mac
docker swarm init

# when running on linux
# docker swarm init --advertise-addr <MANAGER-IP>

# look at the nodes
docker node ls

# Run this on a manager to get the join token
docker swarm join-token worker
