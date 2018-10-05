#Downloading, unzip and subset file

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              destfile = "household_power_consumption.zip", method = "curl")

unzip("household_power_consumption.zip")

hhc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

hhc_2017 <- subset(hhc, Date == "1/2/2007" | Date == "2/2/2007")

#Create and save plot
png("plot1.png", width = 480, height = 480)
hist(hhc_2017$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatt)")
dev.off()