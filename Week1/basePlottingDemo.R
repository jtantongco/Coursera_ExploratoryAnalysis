x <- rnorm(100)
hist(x)
#default y axis label - frequency

y <- rnorm(100)
plot(x,y) #labels as x and y

z <- rnorm(100)
plot(x,z) #labels as x and z -> name of obj

par(mar = c(2,2,2,2))
plot(x,y)

par(mar = c(4,4,2,2))
plot(x,y)

#20 filled in circles #19 semi filled in circle #2 triangle #3 plus
plot(x,y, pch = 20)

#legend for symbols and example of some plots as well
example(points)
#plot symbols 21-25, boundary and  outline color are distinct
# col - fill color and bg - background color
# as well as special characters as wel

#regenerate data since example overwrites
x <- rnorm(100)
y <- rnorm(100)
plot(x,y, pch = 20)
title("Scatterplot")
text(-2,-2,"Label")
legend("topleft", legend = "Data") #no corresponding symbol
legend("topleft", legend = "Data", pch = 20)
#add regression line
fit <- lm(y ~ x)
abline(fit)
abline(fit, lwd = 3) #draws on top of each other
#better to regenerate
abline(fit, lwd = 3, col = "blue")

plot(x,y, xlab = "Weight", ylab = "Height", main="Scatterplot", pch = 20)
legend("topright", legend="Data", pch = 20)
abline(fit, lwd = 3, col="red")

z <-  rpois(100,2)
par(mfrow = c(2,1))
plot(x,y,pch=20)
plot(x,z,pch=19)

par("mar")

#changing the margin
par(mar=c(2,2,1,1))
plot(x,y,pch=20)
plot(x,z,pch=19)

#changing orientation
par(mfrow=c(1,2))
plot(x,y,pch=20)
plot(x,z,pch=19)

#loses y axis label
par(mar = c(4,4,2,2))
plot(x,y,pch=20)
plot(x,z,pch=19)

#--- 4 plots
par(mfrow=c(2,2)) #fills rows first
plot(x,y)
plot(x,z)
plot(z,x)
plot(y,x)

par(mfcol=c(2,2)) #fills cols first
plot(x,y)
plot(x,z)
plot(z,x)
plot(y,x)

#reset
par(mfrow = c(1,1))

x <- rnorm(100)
y <- x + rnorm(100)
g <- gl(2,50, labels = c("Male", "Female"))

str(g)
plot(x,y)

#want plot males in one color and female in a different color
plot(x,y, type="n") #no data but shows plot area
points(x[g=="Male"], y[g=="Male"], col = "green")
points(x[g=="Female"], y[g=="Female"], col = "blue", pch = 19)
