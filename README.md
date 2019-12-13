HUBzero Vagrant
===============
This is a Scotch Box vagrant setup for the HUBzero Content Management System. The main motivation is to create a portable and disposable environment for web development.

** This is NOT a production-ready system!! ** 
The passwords are weak, information may be included in the database, file permissions are not properly set, etc. etc. etc. Why? Because let the sysadmins worry about it while you write your code.
Please checkout [the official HUBzero Website](https://hubzero.org/download) for more secure options. 

If you have issues, [please create an issue on GitHub](https://github.com/kevinwojo/hubzero-vagrant/issues).

The original scotch-box documentation can be found here: [https://github.com/scotch-io/scotch-box/blob/master/README.md](https://github.com/scotch-io/scotch-box/blob/master/README.md). There are some useful things like MailCatcher which can help development.

## Installation and Setup
Using a Terminal application:
 - Run `git clone https://github.com/jza201/hubzero-vagrant`
 - Within the newly created hubzero-vagrant directory, run `vagrant up`.

## Install Radiam Component
Copy the com_radiam directory to ./public/core/components folder. 

From the command line of vagrant (`vagrant ssh`), initialize the Radiam database objects:
```
cd /var/www/hubname

# Dry run, see what will be done:
php muse migration
```

That command should list at least three database migrations that will be run: two for the component, one for the module. If it looks OK, you can proceed:
```
# Full run this time
php muse migration -f
```

Reload vagrant:
`vagrant reload`

## Notes
When `vagrant up` script is ran, it uses git, composer, and muse. The former two require an internet connection.

A development hub should be up and running on [https://192.168.33.10](https://192.168.33.10).
You can log into the hub using the `admin` account with the password `vagrant2016`. 

