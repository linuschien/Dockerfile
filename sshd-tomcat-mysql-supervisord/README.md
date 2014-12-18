Usage
=====
docker build -t centos6:tomcat7 . # use your own tag name<br/>
docker run -d --name="tomcat" centos6:tomcat7 # assign a unique name to container for convenience<br/>
docker inspect tomcat # you can find container's IP address<br/>
ssh {IP} # default root's password setup in Dockerfile