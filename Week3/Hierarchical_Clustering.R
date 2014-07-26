#Bottom up
# Find closest two things, put together, find next closest

# Requires:
# defined distance, merging approach

# produces:
# a tree showing how close things are to each other

# Distance or similarity
# continuous - euclidean distance [any straightline angle]
# continuous - correlation similairy
# binary - manhattan distance [4 cardinal directions]
#     |A1-A2| + |B1-B2| + ...

#As before
set.seed(1234)
par(mar = c(2,2,2,2)) #leaves out axis titles
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)
plot(x, y, col = "blue", pch = 19, cex = 2)
#labels each point with a number
text(x + 0.05, y + 0.05, labels = as.character(1:12))

#important params (x,method)
dataFrame <- data.frame(x=x,y=y)
#creates a dataframe containing the distance of all distinct pairs
# default is euclidean but other metrics are possible
distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
#show the clustering order
plot(hClustering)
#Must cut tree to find the number of clusters at a certain point

source("courseraClust.R")
# color code individual children clusters
# specify number of clusters
myplclust(hClustering, lab = rep(1:3, each = 4), lab.col = rep(1:3, each = 4))

#merging points:
#if 2 points have been merged what is the new location?
# average or centroid of points

#linkage: distance between clusters
# complete -  the distance between the two farthest points in the clusters
# average - the distance between the two centroids

#heatmap
#runs cluster analysis on both rows and columns 
#reorders rows and columns according to hierarchical clustering
set.seed(143)
dataMatrix <- as.matrix(dataFrame)[sample(1:12), ]
heatmap(dataMatrix)
