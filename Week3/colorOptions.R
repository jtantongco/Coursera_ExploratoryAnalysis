#imageplots: low to high color scheme
heat.colors() #red to white
topo.colors() #blue to white

image(volcano, col = heat.colors(20))

#install.packages('grDevices')

library(grDevices)
# colorRamp takes two colors a and b
# creates a function that takes in a % decimal value
# fcn outputs the color that is the % along the transistion from
# color a to b
pal <- colorRamp(c("red", "blue"))
pal(0)
pal(1)
pal(0.5)
#gives back a sequence of colors 
# ie returns the list where pal is applied to each element
pal(seq(0, 1, len = 10))

#colorRampPalette
# takes in two colors
# returns a fcn that takes in a positive integer
# the fcn will return the number of colors to interpolate between the 2 colors
pal <- colorRampPalette(c("red", "yellow"))
pal(2)
pal(10)


# use RColorBrewer for premade palettes
# install.packages('RColorBrewer')

# 3 types of palettes
# sequential [ordered]
# diverging [deviate from mean ie +/- around mean] 
# qualitative [factors / categorical]

library(RColorBrewer)
#See lecture sliders for the specific palette names
# the # of colors in palette
cols <- brewer.pal(3, "BuGn") #Sequential
cols
pal <- colorRampPalette(cols)
image(volcano, col = pal(20))

#Smooth Scatter Fcn
# default color scheme is blue
# dark blue is high density
# light blue is lower density
# avoids the regular plot of just solid circles on top of each other
# in LARGE data sets
x <- rnorm(10000)
y <- rnorm(10000)
smoothScatter(x,y)
#needs RColorBrewer?

#rgb function produce colors based on rgb proportions
# can also add transparency (alpha layers)
rgb(0, 1, 0, alpha=0.5)

#More control over colors
#install.packages('colorspace')
# functionality not covered in lecture

plot(x,y,pch=19) # no idea of density since solid color
plot(x,y,col = rgb(0,0,0,0.2), pch=19) # alpha layer gives density indicator
