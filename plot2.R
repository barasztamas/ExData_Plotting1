library(dplyr)
library(lubridate)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
unzip("data.zip")
data<-(read.csv("household_power_consumption.txt", sep=";", na.strings = "?", stringsAsFactors=F) %>% filter (Date=="1/2/2007"|Date=="2/2/2007"))
data <- mutate(data, datetime = dmy_hms(paste(Date, Time)), Date = NULL, Time = NULL)

png("plot2.png")

with(data, plot(x=datetime, y=Global_active_power, type="l", main="", xlab="", ylab="Global Active Power (kilowatts)"))

dev.off()
