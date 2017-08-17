# Sample docker service of nginx
docker service create \
  --name my-service \
  --mount type=bind,source=/path/on/host,destination=/path/in/container \
  nginx:alpine

#if you wanted to run the latest jenkins
  docker service create \
    --detach=true \
    --replicas 1 \
    --publish 8080:8080 \
    --publish 50000:50000 \
    --name jenkins \
    --mount type=bind,source=/Users/tlevett/jenkins,destination=/var/jenkins_home \
    jenkins

# Swarm visualizer, super helpful
docker service create \
  --detach=true \
  --name=viz \
  --publish=8082:8080/tcp \
  --constraint=node.role==manager \
  --mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
  dockersamples/visualizer

# run mysql locally (change src to not have tlevett :D)
docker service create \
  --detach=true \
  --name=mysql \
  --publish=3306:3306 \
  -e MYSQL_ROOT_PASSWORD= \
  --mount=type=bind,src=/Users/tlevett/data/mysql-incident,dst=/var/lib/mysql \
mysql:5.7
