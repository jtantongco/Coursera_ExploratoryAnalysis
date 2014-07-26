png(filename='plot3.png', width=480, height=480)

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
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()