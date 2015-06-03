#!/usr/bin/env bash

apt-get -qq update

# Install R
echo 'deb http://www.stats.bris.ac.uk/R/bin/linux/ubuntu trusty/' >> /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
apt-get -qq update
apt-get -y -q install r-base-dev

# You need these packages if you're going to install devtools
apt-get -y -q install libcurl4-openssl-dev libxml2-dev

# Useful for checking in the project from RStudio
apt-get -y -q install git

# You need this for Sweave, if you need Sweave
#apt-get -y install texlive texinfo


# Install specific R packages
# I think these will be installed as root.
# If you don't want this go in manually afterwards
# Might be more elegant to make a bootstrap.R script...
#Rscript -e 'options(repos=structure(c(CRAN="http://www.stats.bris.ac.uk/R/"))); install.packages(c("devtools", "testthat"))'

 # Install RStudio Server
fname="rstudio-server-0.99.441-amd64.deb"
 
apt-get -y -q install gdebi-core libapparmor1 # apparmor required only for Ubuntu, not Debian
wget -q http://download2.rstudio.org/$fname
gdebi --n $fname

rm $fname

