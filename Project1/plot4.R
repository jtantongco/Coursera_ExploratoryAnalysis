png(filename='plot4.png', width=480, height=480)

par(mfrow=c(2,2))

#top left
plot(x=date.time,
     y=as.numeric(as.character(powerTable$Global_active_power)),
     type="l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

#top right
plot(x=date.time,
     y=as.numeric(as.character(powerTable$Voltage)),
     type="l",
     xlab = "",
     ylab = "Voltage")

#bottom left
plot(x=date.time, 
     y=as.numeric(as.character(powerTable$Sub_metering_1)), 
     type="l",
     xlab="",
     ylab="Energy Sub Metering"
)

lines(x=date.time,
      y=as.numeric(as.character(powerTable$Sub_metering_2)),
      col='red')

lines(x=date.time,
      y=as.numeric(as.character(powerTable$Sub_metering_3)),
      col='blue')


legend("topright",
        lty=1,
        col=c("black","red","blue"),
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        bty="n")

#bottom right
plot(x=date.time,
     y=as.numeric(as.character(powerTable$Global_reactive_power)),
     type="l",
     xlab = "datetime",
     ylab = "Global_reactive_power"
     )



#dev.copy(png, file="plot4.png") #copies a screenplot into a png
#less efficient and brings screen conversion issues

dev.off()