#base plotting
#additive (plot first then add annotative elements later 
#no subtraction capability though)
#need to keep track of code for reproducibility
#no graphical language

library(datasets)
data(cars)
with(cars, plot(speed,dist))


#lattice system
#every plot is generated with a single command
#look at y changes with x across levels of z 
#"snapshot 2d plots for 3d"
#many plots on one screen
#cannot add plot once its there
#hard to annotate

library(lattice)
data(state)
state <- data.frame(state.x77,region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4,1) )
#layout 4,1 make a 4 plots beside each other that is 1 plot high


#ggplot2
#graphical grammar
# in between the two 
# like lattice but easier to use
library(ggplot2)
data(mpg)
qplot(displ, hwy, data=mpg)