docker run -d -p 8080:8080 -p 50000:50000 -v /Users/tlevett/jenkins:/var/jenkins_home jenkins

docker service create --replicas 1 --name jenkins -p 8080:8080 -p 50000:50000 -v /Users/tlevett/jenkins:/var/jenkins_home jenkins

docker service create \
  --name my-service \
  --mount type=bind,source=/path/on/host,destination=/path/in/container \
  nginx:alpine

  docker service create \
    --detach=true \
    --replicas 1 \
    --publish 8080:8080 \
    --publish 50000:50000 \
    --name jenkins \
    --mount type=bind,source=/Users/tlevett/jenkins,destination=/var/jenkins_home \
    jenkins

docker service create \
  --detach=true \
  --name=viz \
  --publish=8082:8080/tcp \
  --constraint=node.role==manager \
  --mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
  dockersamples/visualizer

docker run --name localIncident -e MYSQL_ROOT_PASSWORD=password -d mysql:5.7

docker service create \
  --detach=true \
  --name=mysql \
  --publish=3306:3306 \
  -e MYSQL_ROOT_PASSWORD= \
  --mount=type=bind,src=/Users/tlevett/data/mysql-incident,dst=/var/lib/mysql \
mysql:5.7
