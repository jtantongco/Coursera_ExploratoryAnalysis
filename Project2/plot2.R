sourceClass <- readRDS("Source_Classification_Code.rds")
summary <- readRDS("summarySCC_PM25.rds")

#names(summary)

baltimoreData <- summary[summary$fips=="24510",]
#length(baltimoreData)
#length(baltimoreData$SCC)

baltimoreSummaryByYear <- split(baltimoreData,baltimoreData$year)

baltimoreSumsByYear <- sapply(baltimoreSummaryByYear, function(x) sum(x$Emissions))

png(filename="plot2.png", width=480, height=480)
plot(x=unique(summary$year),
     y=baltimoreSumsByYear, 
     main="Plot 2: Total Baltimore Emission",
     xlab="Year",
     ylab="Emissions",
     type="l")

dev.off()