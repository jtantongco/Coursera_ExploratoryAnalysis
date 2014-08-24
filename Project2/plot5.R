sourceClass <- readRDS("Source_Classification_Code.rds")
summary <- readRDS("summarySCC_PM25.rds")

baltimoreData <- summary[summary$fips=="24510",]

sourceNames <- sourceClass$Short.Name

motorVehicleSources <- grepl("[Mm]otor", sourceNames)
#when I use [Mm]otor [Vv]ehicle only nets me 2 hits in baltimore
sum(motorVehicleSources)

sourceSCC <- sourceClass$SCC
mvSCC <- sourceSCC[motorVehicleSources]

mvSelector <- baltimoreData$SCC %in% mvSCC
baltimoreMVData <- baltimoreData[mvSelector,]

#sum(mvSelector)
#unique(baltimoreMVData$year)

balimoreYearlyMVData <- split(baltimoreMVData, baltimoreMVData$year)
baltimoreMVSumsByYear <- sapply(balimoreYearlyMVData, function(x) sum(x$Emissions))

#baltimoreMVSumsByYear

png(filename="plot5.png", width=480, height=480)
plot(x=unique(baltimoreMVData$year),
     y=baltimoreMVSumsByYear, 
     main="Plot 5: Total Baltimore Motor Emission",
     xlab="Year",
     ylab="Emissions",
     type="l")

dev.off()