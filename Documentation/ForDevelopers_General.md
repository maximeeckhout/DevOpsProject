# Documentation DevOps

## Access Azure Server

Go to http://portal.azure.com and login using your school email address.

Check the dashboard and click on 'Projecten3StudServer09'.

Wait a second and click on 'start'.



## Access Website

After launch of the server, or after a new build on github. Wait 10 minutes and the website should be visible on: http://projecten3studserver09.westeurope.cloudapp.azure.com:4200/



## Access Webserver

After launch of the server, or after a new build on github. Wait 2 minutes and you could check if the webserver runs with:

http://projecten3studserver09.westeurope.cloudapp.azure.com:3000/api/

OR if the website is running with:

 http://projecten3studserver09.westeurope.cloudapp.azure.com:4200/API/users/students



## Access Database

You can access the database via ssh on the domain name:

projecten3studserver09.westeurope.cloudapp.azure.com

On port 3600.

The database user is:

name: DBStudent4

password: DBStudent418



## Access server

Should you need access on the server, using an ssh connection you can do the following:

```bash
ssh student@projecten3studserver09.westeurope.cloudapp.azure.com
```

And log in with the password you have been given to by the teacher.

If you are on windows, use putty. Select ssh connection and only enter  "projecten3studserver09.westeurope.cloudapp.azure.com" in the host part, after this press connect and you should get a prompt to log in. Use user student and again password that has been given to you by the teacher.
