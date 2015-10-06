#!/usr/bin/env bash

# Some R dates
checkpointDate="2014-11-15"
Rver="3.1.2"

apt-get -qq update

# Make user in the staff group
addgroup vagrant staff

# Install R
echo 'deb http://www.stats.bris.ac.uk/R/bin/linux/ubuntu trusty/' >> /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
apt-get -qq update
# Specifically version 3.1.2
apt-get -y -qq install r-base-core=$Rver-1trusty0
apt-get -y -qq install r-base-dev=$Rver-1trusty0

# You need these packages if you're going to install devtools
apt-get -y -qq install libcurl4-openssl-dev libxml2-dev

# Useful for checking in the project from RStudio
apt-get -y -qq install git

# You need this for Sweave, if you need Sweave
#apt-get -y install texlive texinfo


# Install specific R packages
# I think these will be installed as root.
# If you don't want this go in manually afterwards
# Might be more elegant to make a bootstrap.R script...
#Rscript -e 'options(repos=structure(c(CRAN="http://www.stats.bris.ac.uk/R/"))); install.packages(c("devtools", "testthat"))'

# Install latest version of checkpoint package.
# As soon as archive of version checkpoint_0.3.15.tar.gz is available hard link to that
mkdir /home/vagrant/.checkpoint
# This will install the packages as they were on
Rscript /vagrant/checkpoint.R --args $checkpointDate $Rver
# Mv the packages into the main R site library
mv /home/vagrant/.checkpoint/$checkpointDate/lib/x86_64-pc-linux-gnu/$Rver/* /usr/local/lib/R/site-library/


 # Install RStudio Server
fname="rstudio-server-0.99.485-amd64.deb"
 
apt-get -y -q install gdebi-core
wget -q http://download2.rstudio.org/$fname
gdebi --n $fname

rm $fname

