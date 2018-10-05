#Downloading, unzip and subset file

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              destfile = "household_power_consumption.zip", method = "curl")
unzip("household_power_consumption.zip")
hhc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
hhc_2017 <- subset(hhc, Date == "1/2/2007" | Date == "2/2/2007")

#Create right column for date-time

hhc_2017$date_time <- paste(hhc_2017$Date, hhc_2017$Time)
hhc_2017$date_time_f <- strptime(hhc_2017$date_time, "%d/%m/%Y %H:%M:%S")

#Create and save plot
png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))
#1st plot
plot(hhc_2017$date_time_f, hhc_2017$Global_active_power, type="l", xlab = "",
     ylab="Global Active Power (kilowatt)" ) 

#2nd plot
plot(hhc_2017$date_time_f, hhc_2017$Voltage, type="l", xlab = "datetime",
     ylab="Voltage" ) 

#3d plot
plot(hhc_2017$date_time_f, hhc_2017$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering") 
lines(hhc_2017$date_time_f, hhc_2017$Sub_metering_2, type="l", col = "red")
lines(hhc_2017$date_time_f, hhc_2017$Sub_metering_3, type="l", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, cex=0.8)

#4th plot
plot(hhc_2017$date_time_f, hhc_2017$Global_reactive_power, type="l", xlab = "datetime",
     ylab="Global_reactive_power" ) 

dev.off()