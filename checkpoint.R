# set a mirror
options(repos=structure(c(CRAN="http://www.stats.bris.ac.uk/R/")))

# install latest version of checkpoint. In future this should be hard linked
# to the 0.3.15 release when that's on the archive
install.packages("checkpoint")

library(checkpoint)

# Get the date from the input
checkDate <- commandArgs(TRUE)[2]
Rver <- commandArgs(TRUE)[3]

checkpoint(snapshotDate=checkDate, project = "/vagrant/", R.version=Rver,
  scanForPackages = TRUE, checkpointLocation = "/home/vagrant/", verbose = TRUE)

