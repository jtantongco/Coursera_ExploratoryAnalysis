pollution <- read.csv("data/avgpm25.csv", colClasses=c("numeric",
                                                       "character",
                                                       "factor",
                                                       "numeric",
                                                       "numeric"))
head(pollution)

#gives 6 statistical numbers
summary(pollution$pm25)

#boxplot
boxplot(pollution$pm25, col="blue")
abline(h=12) #puts a horizontal line at value of interest


#histogram
hist(pollution$pm25, col="green")
rug(pollution$pm25) #shows exactly where points are in histogram
abline(v=12,lwd=2) #puts a vertical line #lwd is line width
abline(v=median(pollution$pm25),col="magenta", lwd=4)

hist(pollution$pm25, col="green", breaks = 100) #change the number of intervals

#barplot
barplot(table(pollution$region), col="wheat", main="Number of Countries in Each Region")

#Multiple
#box plot of pm25 making one for each region
boxplot(pm25~region, data = pollution, col="red")

#histogram
par(mfrow = c(2,1), mar = c(4,4,2,1)) 
#make space for and display two histograms
#one on top of the other [controlled by mfrow]
hist(subset(pollution, region=="east")$pm25, col="green")
hist(subset(pollution, region=="west")$pm25, col="green")

#scatterplot
#note that par changes are persistent and not just for the histogram example
# if run before
with(pollution, plot(latitude, pm25)) 
abline(h=12, lwd=2, lty=2) # applies to the last plot created always?
with(pollution, plot(latitude, pm25, col=region)) # coloring by region
#black is east - #red is west
abline(h=12, lwd=2, lty=2)

#subsetting
#make space for and display two histograms
#one beside the other
par(mfrow = c(1,2), mar = c(5,4,2,1))
with(subset(pollution, region == "west"), plot(latitude, pm25, main="West"))
with(subset(pollution, region == "east"), plot(latitude, pm25, main="East"))
#main is the plot title