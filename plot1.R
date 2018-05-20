##variables
filepath <- "household_power_consumption.txt"

## loading data from 2007-02-01 to 2007-02-02
powerconsumption <- read.table(filepath,header=TRUE,sep=";",na.strings="?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
powerconsumption$Date <- paste(powerconsumption$Date,powerconsumption$Time)
powerconsumption$Date<- dmy_hms(powerconsumption$Date)
powerconsumption <- subset(powerconsumption,Date<=ymd("2007-02-03")&Date>=ymd("2007-02-01"))

## plot
hist(powerconsumption$Global_active_power,main="Global Active Power",xlab="Global Active Power(kilowatts)",col="red")

dev.copy(png,"plot1.png")
dev.off()
