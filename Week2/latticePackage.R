#xyplot(y~x|f*g,data)
# y: y-axis variable
# x: x-axis variable
# f * g: categorical conditioning variables
# * denotes interaction between variables
# data: souce / data.frame to search for variables in function call

#Single plot
library(lattice)
library(datasets)
## Simple scatterplot
xyplot(Ozone ~ Wind, data = airquality)

#Multiple plots beside broken down by month
library(datasets)
library(lattice)
## Convert 'Month' to a factor variable
airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5, 1))

# Lattice returns a trellis object 
# that is autoprinted to graphics device if it makes it to the command line
#Theoretically possible to store object but better to save generating code
p <- xyplot(Ozone ~ Wind, data = airquality)  ## Nothing happens!
print(p)  ## Plot appears

#panel functions
set.seed(10)
x <- rnorm(100) #random data
f <- rep(0:1, each = 50) #factor that will break the data into groups
y <- x + f - f * x + rnorm(100, sd = 0.5) # make a y relationship
f <- factor(f, labels = c("Group 1", "Group 2")) #assign names to the labels
xyplot(y ~ x | f, layout = c(2, 1))  ## Plot with 2 panels (seperated by group)


## Custom panel function
xyplot(y ~ x | f, panel = function(x, y, ...) {
    panel.xyplot(x, y, ...)  ## First call the default panel function for 'xyplot'
    panel.abline(h = median(y), lty = 2)  ## Add a horizontal line at the median
}) 

## Custom panel function
xyplot(y ~ x | f, panel = function(x, y, ...) {
    panel.xyplot(x, y, ...)  ## First call default panel function
    panel.lmline(x, y, col = 2)  ## Overlay a simple linear regression line
})

# Note cannot use base plotting functions 
# generally cannot mix functions between packages
# CANNOT ANNOTATE (using base functions only?)

# Good for same plot under varying conditions