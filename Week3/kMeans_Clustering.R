# partitioning
# Fix number of clusters
# Get centroids
# assign things to closest centroid
# recalculate centroid

# Requires:
# defined distance, number of cluster, initial centroid guess

# produces:
# final estimate of cluster centroids,
# assginment of each point to clusters

set.seed(1234)
par(mar = c(2,2,2,2)) #leaves out axis titles
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)
plot(x, y, col = "blue", pch = 19, cex = 2)
#labels each point with a number
text(x + 0.05, y + 0.05, labels = as.character(1:12))

dataFrame <- data.frame(x,y)
kmeansObj <- kmeans(dataFrame, centers = 3)
names(kmeansObj)
#assignment of points to cluster
kmeansObj$cluster

par(mar = rep(0.2, 4))
#plot the points color coded by cluster
plot(x, y, col = kmeansObj$cluster, pch = 19, cex = 2)
#draw the centroids of the kmeans
points(kmeansObj$centers, col = 1:3, pch = 3, cex = 3, lwd = 3)

#heatmaps
set.seed(1234)
dataMatrix <- as.matrix(dataFrame)[sample(1:12), ]
kmeansObj2 <- kmeans(dataMatrix, centers = 3)
par(mfrow = c(1, 2), mar = c(2, 4, 0.1, 0.1))
image(t(dataMatrix)[, nrow(dataMatrix):1], yaxt = "n")
image(t(dataMatrix)[, order(kmeansObj$cluster)], yaxt = "n")

#link in slides on website re: how to determine # of clusters
#not deterministic -> run a couple of time