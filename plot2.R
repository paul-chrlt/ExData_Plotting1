##variables
filepath <- "household_power_consumption.txt"

##libraries
library(lubridate)

## loading data from 2007-02-01 to 2007-02-02
powerconsumption <- read.table(filepath,header=TRUE,sep=";",na.strings="?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
powerconsumption$Date <- paste(powerconsumption$Date,powerconsumption$Time)
powerconsumption$Date<- dmy_hms(powerconsumption$Date)
powerconsumption <- subset(powerconsumption,Date<=ymd("2007-02-03")&Date>=ymd("2007-02-01"))

## plot
plot(powerconsumption$Date,powerconsumption$Global_active_power,type="l",ylab="Global Active Power (kilowartts)",xlab=" ")

dev.copy(png,"plot2.png")
dev.off()
