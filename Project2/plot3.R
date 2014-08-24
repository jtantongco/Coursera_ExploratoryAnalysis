library(ggplot2)

sourceClass <- readRDS("Source_Classification_Code.rds")
summary <- readRDS("summarySCC_PM25.rds")

baltimoreData <- summary[summary$fips=="24510",]

#note - COnsidering the one nonpoint point that is > 1000 emissions as a outlier
# because it skews the scale of the plot
plot3 <- qplot(year, Emissions, data=baltimoreData, 
                color=type, 
                facets = . ~ type,
                geom=c("point", "smooth"),
                method="lm")
#plot3 <- plot3 + ylim(0,500)
plot3 <- plot3 + coord_cartesian(ylim = c(-50,500))

ggsave(filename="plot3.png", plot=plot3)
dev.off()

