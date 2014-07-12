#use plot( ... ) -> really powerful but needs a lot of configuration
#parameters of plot documented in ?par

#generally required
library(datasets)

#histogram
hist(airquality$Ozone)

#scatterplot
with(airquality, plot(Wind, Ozone))

#Boxplot
#Broken up by the month --- need clarification on the syntax of it...
# especially the ~
airquality <- transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab ="Month", ylab = "Ozone (ppb)")

#Base graphic parameters
#pch - plotting symbol [# for built in symbol tables or characters]
#lty - line type [solid, dashed, dotted...]
#lwd - line width
#col - plotting colors colors() gives a vector of colors by name
#xlab/ylab - x or y axis labels

#par() changes will have change in all graphics since global settings
# las - orientation of axis labels on plot
# bg - background color
# mar - margin size
# oma - the outer margin size (0 default for all sides - important in multi plot)
# mfrow/mfcol - the number of plots per row/col in multi plot

#view defaults
par("lty")
par("col")
par("pch")
par("bg")
par("mar") #gives 4 numbers 
# 1st number is bottom and goes clockwise
par("mfrow") #mfrow and mfcol are both returned when mfrow or mfcol are called

#plot - scatterplot
#lines - add lines to any plot
#points - add points to a plot
#text - add text labesl to a plot using speified coordinates (in plot)
#titles - add annotations outside plot
#mtext - add arbitray text to inner/outer margins of plot
#axis adding axis ticks/labels

#title
with(airquality, plot(Wind, Ozone))
title(main = "Ozone and Wind in New York City") #Major name

#Equivalent to above
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City"))

#Writing type = "n" will initialize all plot settings will not plot (no plotting)
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City"), type="n")
#Note that the next lines only adds points to the existing plot 
#you can add points to histograms despite how dumb that looks
#Color the points from May in Blue
with(subset(airquality, Month == 5), points(Wind,Ozone, col="blue"))
with(subset(airquality, Month != 5), points(Wind,Ozone, col="red"))
#add a legend 
legend("topright", pch = 1, col=c("blue","red"), legend = c("May", "Other Months"))


with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", pch = 20), type="n")
#Regression
model <- lm(Ozone ~ Wind, airquality)
abline(model,lwd=2)

#multiplots
#plots 2 side by side plots
par(mfrow = c(1,2))
with(airquality, {
    plot(Wind,Ozone,main = "Ozone and Wind")
    plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
})

par(mfrow = c(1,3),mar = c(4,4,2,1), oma=c(0,0,2,0))
with(airquality,{
    plot(Wind,Ozone,main = "Ozone and Wind")
    plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
    plot(Temp, Ozone, main = "Ozone and Temperature")
    #main title of all 3 plots
    mtext("Ozone and Weather in New York City", outer = TRUE)
})