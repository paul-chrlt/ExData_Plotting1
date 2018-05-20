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
plot(powerconsumption$Date,powerconsumption$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=" ")
lines(powerconsumption$Date,powerconsumption$Sub_metering_2,col="red",lwd=3)
lines(powerconsumption$Date,powerconsumption$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

dev.copy(png,"plot3.png")
dev.off()
