library(dplyr)
library(lubridate)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
unzip("data.zip")
data<-(read.csv("household_power_consumption.txt", sep=";", na.strings = "?", stringsAsFactors=F) %>% filter (Date=="1/2/2007"|Date=="2/2/2007"))
data <- mutate(data, datetime = dmy_hms(paste(Date, Time)), Date = NULL, Time = NULL)

png("plot1.png")

hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()
