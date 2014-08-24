sourceClass <- readRDS("Source_Classification_Code.rds")
summary <- readRDS("summarySCC_PM25.rds")

baltimoreData <- summary[summary$fips=="24510",]

sourceNames <- sourceClass$Short.Name

coalSources <- grepl("coal|Coal", sourceNames)
#head(coalSources)
#sum(coalSources) #239 sources
#length(coalSources)

sourceSCC <- sourceClass$SCC
coalSCC <- sourceSCC[coalSources]
#length(coalSCC)

coalSelector <- baltimoreData$SCC %in% coalSCC
#length(coalSelector) #2096 same as total size of baltimoreData set
#sum(coalSelector) #19 --> assuming charcoal counts as coal
baltimoreCoalData <- baltimoreData[coalSelector,]

balimoreYearlyCoalData <- split(baltimoreCoalData, baltimoreCoalData$year)
baltimoreCoalSumsByYear <- sapply(balimoreYearlyCoalData, function(x) sum(x$Emissions))

png(filename="plot4.png", width=480, height=480)
plot(x=unique(baltimoreCoalData$year),
     y=baltimoreCoalSumsByYear, 
     main="Plot 4: Total Baltimore Coal Emission",
     xlab="Year",
     ylab="Emissions",
     type="l")

dev.off()