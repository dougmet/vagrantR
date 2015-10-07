
# Get the date from the input
checkDate <- commandArgs(TRUE)[2]
Rver <- commandArgs(TRUE)[3] # Not currently used

# Set a mirror on the right date
cranMirror <- paste0("http://mran.revolutionanalytics.com/snapshot/", checkDate)
options(repos=structure(c(CRAN=cranMirror)))

# Install the packages we want

install.packages(c("zoo", "ggplot2"))

