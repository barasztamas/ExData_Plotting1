library(dplyr)
library(lubridate)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
unzip("data.zip")
data<-(read.csv("household_power_consumption.txt", sep=";", na.strings = "?", stringsAsFactors=F) %>% filter (Date=="1/2/2007"|Date=="2/2/2007"))
data <- mutate(data, datetime = dmy_hms(paste(Date, Time)), Date = NULL, Time = NULL)

png("plot4.png")

par(mfrow = c(2, 2))
with(data, {
  
  plot(x=datetime, y=Global_active_power, type="l", main="", xlab="", ylab="Global Active Power")
  
  plot(x=datetime, y=Voltage, type="l")
  
  plot(x=datetime, y=Sub_metering_1, type="l", main="", xlab="", ylab="Energy sub metering")
  lines(x=datetime, y=Sub_metering_2, col="red")
  lines(x=datetime, y=Sub_metering_3, col="blue")
  legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lty=0)
  box()
  
  plot(x=datetime, y=Global_reactive_power, type="l")  
  
})

dev.off()
