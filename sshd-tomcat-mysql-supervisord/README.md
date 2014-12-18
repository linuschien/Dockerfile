Usage
=====
<ul>
	<li>docker build -t centos6:tomcat7 . # use your own tag name</li>
	<li>docker run -d --name="tomcat" centos6:tomcat7 # assign a unique name to container for convenience</li>
	<li>docker inspect tomcat # you can find container's IP address</li>
	<li>ssh {IP} # default root's password setup in Dockerfile</li>
</ul>