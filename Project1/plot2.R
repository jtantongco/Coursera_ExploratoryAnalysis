png(filename='plot2.png', width=480, height=480)

plot(x=date.time,
     y=as.numeric(as.character(powerTable$Global_active_power)),
     type="l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
dev.off()