sourceClass <- readRDS("Source_Classification_Code.rds")
summary <- readRDS("summarySCC_PM25.rds")

#4 years: 1999, 2002, 2005, 2008
unique(summary$year)

summaryByYear <- split(summary,summary$year)

sumsByYear <- sapply(summaryByYear, function(x) sum(x$Emissions))

png(filename="plot1.png", width=480, height=480)
plot(x=unique(summary$year),
        y=sumsByYear, 
        main="Plot 1: Total US Emission",
        xlab="Year",
        ylab="Emissions",
        type="l")

dev.off()