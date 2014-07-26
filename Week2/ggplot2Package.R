#uses data frames always (or will default to workspace)
#good practices for labelled data

#3 things
# 1. aesthetics - size, shape, coloar, etc.
# 2. geoms      - points, lines, etc.
# 3. factors    - how data is divided - subsets of geoms - labels data too

library(ggplot2)
str(mpg)

#args
#x, y, source
#x and y variables are searched for in souce
#scatterplot
qplot(displ, hwy, data=mpg)

#color code on the drv variable
qplot(displ,    hwy,	data	=	mpg,	color	=	drv)	

#adding a geom (shape to the data)
#best fit line?
qplot(displ,    hwy,	data	=	mpg,	geom	=	c("point",	"smooth"))	

#histogram
#only 1 variable
#color code by drv variable
qplot(hwy,    data	=	mpg,	fill	=	drv)

#facets
#like panels in latice
#make seperate plots for different values of drv
# . ~ drv
# split up rows by values in . (ie do not seperate out rows)
# split up cols by values in drv
qplot(displ,    hwy,	data	=	mpg,	facets	=	.	~	drv)
# drv ~ .
# split up cols by values in . (ie do not seperate out cols)
# split up rows by values in drv
qplot(hwy,    data	=	mpg,	facets	=	drv	~	.,	binwidth	=	2)	

#axis limits
#plot will generate and cut off the 100 value outlier
testdat <- data.frame(x = 1:100, y = rnorm(100))
testdat[50,2] <- 100 ## Outlier!
plot(testdat$x, testdat$y, type = "l", ylim = c(-3,3))

#plot will rescale to include the outlier 
#note the use of the line function 
#creates a line plot and not a scatter plot
# see other notes regarding this syntax semantics
g <- ggplot(testdat, aes(x = x, y = y))
g + geom_line()