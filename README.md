# vagrantR
A demo of using Vagrant together with R

All you're meant to do with this repo is run

```
> git clone https://github.com/dougmet/vagrantR.git 
> cd vagrantR
> vagrant up
```

and it will pull in the base Ubuntu box. Update and install R, pull in RStudio and set it running. You then go to your browser and navigate to

http://localhost:8787

Log in as username: vagrant, password: vagrant

Play with R. When you're done type

```
> vagrant halt
```

to shutdown but save the machine and

```
> vagrant destroy
```

to delete the disk image (it won't delete your Vagrant file)

