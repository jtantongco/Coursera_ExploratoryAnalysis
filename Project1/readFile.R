library(data.table)

#params: file, header, sep, row.names, nrows
powerData <- read.table('household_power_consumption.txt',
                            header=TRUE,
                            sep=';')

#     names(powerData)
# [1] "Date"                  "Time"                  "Global_active_power"  
# [4] "Global_reactive_power" "Voltage"               "Global_intensity"     
# [7] "Sub_metering_1"        "Sub_metering_2"        "Sub_metering_3"  

DateFormat <- '%d/%m/%Y'
TimeFormat <- '%H:%M:%S'
combinedFormat <- paste(DateFormat, TimeFormat, sep=" ")
DefaultDateFormat <- '%Y-%m-%d'

date1 <- as.Date('2007-02-01', DefaultDateFormat)
date2 <- as.Date('2007-02-02', DefaultDateFormat)

#rawDate1 <- format(date1, DateFormat)
#rawDate2 <- format(date2, DateFormat)

filterPowerData <- powerData[{as.Date(powerData$Date, DateFormat) == date1 |
                                   as.Date(powerData$Date, DateFormat) == date2},]
powerTable <- data.table(filterPowerData)

#apparently plus is not a defined operation for datetimes...
powerTable[,DateTime := paste( powerTable$Date, 
                               powerTable$Time, 
                               sep= " ")] 
#overly complciated?
#dateTimes <- powerTable$DateTime
#dateTimes <- lapply(dateTimes, function(x) strptime(x, combinedFormat))

date <- as.character(powerTable$Date)
time <- as.character(powerTable$Time)
date.time <- paste(date, time)
date.time <- strptime(date.time, "%d/ %m/ %Y %H: %M: %S")
