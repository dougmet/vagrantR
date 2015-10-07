# Building an R Time Machine

> Build a box with R and a package inventory as it was in the past

A demo using Vagrant together with R. This has been updated to be a proof-of-concept inspired by the checkpoint package from [Revolution Analytics](http://blog.revolutionanalytics.com/2014/10/introducing-rrt.html) that connects to daily snapshots of the CRAN mirror. You can then specify an R version and a date and build R as it would have been on that day.

The `bootstrap.sh` script sets the CRAN mirror to the daily snapshot on [MRAN](https://mran.revolutionanalytics.com/) as is done in the `checkpoint` package. The `bootstrap.R` file then installs a package inventory. You can change the date and R version in `bootstrap.sh`. The MRAN mirror is fixed in the `RProfile.site` file so should persist for users after installation.

All you're meant to do with this repo is run

```
> git clone https://github.com/dougmet/vagrantR.git 
> cd vagrantR
> vagrant up
```

and it will pull in the base Ubuntu box. Update and install R 3.1.2 (default), install zoo and ggplot2 from 2014-11-15 (default), pull in RStudio and set it running. You then go to your browser and navigate to

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

