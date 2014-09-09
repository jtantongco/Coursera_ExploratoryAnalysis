# Question 2
library(lattice)
library(datasets)
data(airquality)
p <- xyplot(Ozone ~ Wind | factor(Month), data = airquality)
plot(p)

# Question 8
library(ggplot2)
data(airquality)

#correct -> breaks down by month
airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)

#Error in syntax
qplot(Wind, Ozone, data = airquality, facets = . ~ factor(Month))

#unified master scatter plot with trendline and confidence interval
qplot(Wind, Ozone, data = airquality, geom = "smooth")

#unified scatter plot only
qplot(Wind, Ozone, data = airquality)

#Question 9
library(ggplot2)
g <- ggplot(movies, aes(votes, rating))
plot(g)

#Question 10
#starting statement, add trendline
qplot(votes, rating, data = movies)

#Adds a trendline
qplot(votes, rating, data = movies) + geom_smooth()