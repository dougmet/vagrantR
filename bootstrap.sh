#!/usr/bin/env bash

# Specify the R version
checkpointDate="2014-11-15"
Rver="3.1.2"

# Set the mirrors we'll be using
cranMirror="http://mran.revolutionanalytics.com/snapshot/"$checkpointDate
rCranMirror="http://cran.rstudio.com"

# Set some user permissions
addgroup vagrant staff

# Install R (still using normal mirror)
echo "deb "$rCranMirror"/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list
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

# Set the Rprofile.site with the right mirror
# ## Example of Rprofile.site
echo -e "local({\n  r <- getOption(\"repos\")\n\
	r[\"CRAN\"] <- \
\""$cranMirror"\"\n\
  options(repos = r)\n\
})\n" >> /etc/R/Rprofile.site

# Install specific R packages
# I think these will be installed as root.
# If you don't want this go in manually afterwards
## This will install the packages as they were on $checkpointDate
Rscript /vagrant/bootstrap.R --args $checkpointDate $Rver

 # Install RStudio Server
fname="rstudio-server-0.99.485-amd64.deb"
 
apt-get -y -q install gdebi-core
wget -q http://download2.rstudio.org/$fname
gdebi --n $fname

rm $fname

