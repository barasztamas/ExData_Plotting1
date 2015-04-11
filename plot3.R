library(dplyr)
library(lubridate)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
unzip("data.zip")
data<-(read.csv("household_power_consumption.txt", sep=";", na.strings = "?", stringsAsFactors=F) %>% filter (Date=="1/2/2007"|Date=="2/2/2007"))
data <- mutate(data, datetime = dmy_hms(paste(Date, Time)), Date = NULL, Time = NULL)

png("plot3.png")

with(data, {
  plot(x=datetime, y=Sub_metering_1, type="l", main="", xlab="", ylab="Energy sub metering")
  lines(x=datetime, y=Sub_metering_2, col="red")
  lines(x=datetime, y=Sub_metering_3, col="blue")
  legend("topright", lwd=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

dev.off()
