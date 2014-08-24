library(ggplot2)
library(data.table)

sourceClass <- readRDS("Source_Classification_Code.rds")
summary <- readRDS("summarySCC_PM25.rds")

BaltimoreData <- summary[summary$fips=="24510",]
LAData <- summary[summary$fips=="06037",]
mergedData <- rbind(BaltimoreData,LAData)
cityFilterData <- data.table(mergedData)

cityFilterData[,city:=ifelse(fips=="24510","Baltimore","L. A.")]

head(cityFilterData)
sourceNames <- sourceClass$Short.Name

motorVehicleSources <- grepl("[Mm]otor", sourceNames)

sourceSCC <- sourceClass$SCC
mvSCC <- sourceSCC[motorVehicleSources]

mvSelector <- cityFilterData$SCC %in% mvSCC
cityFilterMVData <- cityFilterData[mvSelector,]

cityFilterMVData

plot6 <- qplot(year, Emissions, data=cityFilterMVData,
               facets = . ~ city,
               color=city,
               geom=c("point", "smooth"),
               method="lm")
#plot6 <- plot6 + coord_cartesian(ylim = c(-5,20))
ggsave(filename="plot6.png",plot=plot6, width=5.2,height=2.5)

#--- Alternate solution base plotting system ----

baltimoreData <- summary[summary$fips=="24510",]
LAData <- summary[summary$fips=="06037",]

sourceNames <- sourceClass$Short.Name

motorVehicleSources <- grepl("[Mm]otor", sourceNames)
#when I use [Mm]otor [Vv]ehicle only nets me 2 hits in baltimore
sum(motorVehicleSources)

sourceSCC <- sourceClass$SCC
mvSCC <- sourceSCC[motorVehicleSources]

mvSelector <- baltimoreData$SCC %in% mvSCC
baltimoreMVData <- baltimoreData[mvSelector,]

mvSelector2 <- LAData$SCC %in% mvSCC
LAMVData <- LAData[mvSelector2,]

#sum(mvSelector)
#unique(baltimoreMVData$year)

balimoreYearlyMVData <- split(baltimoreMVData, baltimoreMVData$year)
baltimoreMVSumsByYear <- sapply(balimoreYearlyMVData, function(x) sum(x$Emissions))

LAYearlyMVData <- split(LAMVData, LAMVData$year)
LAMVSumsByYear <- sapply(LAYearlyMVData, function(x) sum(x$Emissions))

head(LAMVSumsByYear)


png(filename="plot6a.png")
plot(x=unique(baltimoreMVData$year),
     y=baltimoreMVSumsByYear, 
     main="Plot 6a: Total Baltimore Motor Emission",
     xlab="Year",
     ylab="Emissions",
     type="l")
dev.off()

png(filename="plot6b.png")
plot(x=unique(LAMVData$year),
     y=LAMVSumsByYear, 
     main="Plot 6b: Total LA Motor Emission",
     xlab="Year",
     ylab="Emissions",
     type="l")
dev.off()