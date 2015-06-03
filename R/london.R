# Set the working directory
setwd("/vagrant")

london <- read.csv("data/london.csv")

View(london)

plot(london$Area, london$Population, pch=21, col='blue', bg='orange',
     main="Really interesting plot", xlab="Area", ylab="Population")
