png(filename='plot1.png', width=480, height=480)

hist(as.numeric(as.character(powerTable$Global_active_power)), 
            col="red",
            main="Global Active Power",
            xlab="Global Active Power (kilowatts)")

#more efficient, harder to understand and generates a warning 
# hist(as.numeric(levels(filterPowerData$Global_reactive_power))[filterPowerData$Global_reactive_power], 
#      col="red",
#      main="Global Active Power",
#      xlab="Global Active Power (kilowatts)")

dev.off()