# Download a MySQL Server docker image

- community server with tag(the version you want):
  docker pull container-registry.oracle.com/mysql/community-server:tag

- community server latest version:
  docker pull container-registry.oracle.com/mysql/community-server

# To start a new Docker container for a MySQL Server

docker run --name=mysql_server --restart on-failure -d container-registry.oracle.com/mysql/community-server:latest

- to monitor the output from the container:
  docker logs mysql_server

- check the random password generated for the root user:
  docker logs mysql_server 2>&1 | grep GENERATED

# Connecting to MySQL Server from withing the container

- use the docker "exec -it" command to start a "mysql" client inside the docker container(will require the root password from the above step)
  docker exec -it mysql_server mysql -uroot -p

- reset the server root password with the following command(substitute password with the actual password you want to use)
  ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';

- for shell access to the MySQL Server container use the following command
  docker exec -it mysql_server bash

# Stopping and Deleting an MySQL Container

- stop the container
  docker stop mysql_server

- start the container
  docker start mysql_server

- stop and start again the container
  docker restart mysql_server

- delete the container(stop it first)
  docker stop mysql_server
  docker rm mysql_server

- to delete the volume
  docker stop mysql_server
  docker rm -v mysql_server

# Coping local files to the container

- docker cp <local_file_name> <container_id:/destination>
