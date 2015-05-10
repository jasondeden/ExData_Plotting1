library(data.table)
library(datasets)

#Import data from PWD with header
sourcedata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", quote="\"", na.strings="?", stringsAsFactors=FALSE)

#Convert Date variable from string to date format
sourcedata$Date <- as.Date(sourcedata$Date, "%d/%m/%Y")

#Subset data to just 2/1-2/2007
sourcedatasub1 <- sourcedata[(sourcedata$Date=="2007-02-01") | (sourcedata$Date=="2007-02-02"),]

#Convert Time variable from string to time format
sourcedatasub1$Time <- strptime(sourcedatasub1$Time, "%H:%M:%S")
#Note - need to figure out how to convert without adding today's date to time stamp - won't affect program output though

#Open .png file -- png default values are 480x480 pixels with white background
png(filename="plot4.png")

#Set up a 2x2 display for columns, filling col 1 first
par(mfcol=c(2,2), cex.lab=0.5)

#PLOT 1 Create plot Global Active Power with Day labels on x axis
plot(sourcedatasub1$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="", main="", xaxt="n")

#Assume equal number of readings collected per day, label X axis by thirds
axis(1, at=0, label="Thu")
axis(1, at=1440, label="Fri")
axis(1, at=2880, label="Sat")

#PLOT 2 Create plot submetering
plot(sourcedatasub1$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", main="", xaxt="n")
lines(sourcedatasub1$Sub_metering_2, col="red")
lines(sourcedatasub1$Sub_metering_3, col="blue")

#Add Legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), pch="-", lwd=2, bty="n", cex=0.5)

#Assume equal number of readings collected per day, label X axis by thirds
axis(1, at=0, label="Thu")
axis(1, at=1440, label="Fri")
axis(1, at=2880, label="Sat")

#PLOT 3 voltage
plot(sourcedatasub1$Voltage, type="l", ylab="voltage", xlab="datetime", main="", xaxt="n")

#Assume equal number of readings collected per day, label X axis by thirds
axis(1, at=0, label="Thu")
axis(1, at=1440, label="Fri")
axis(1, at=2880, label="Sat")


#PLOT 4 global reactive power
plot(sourcedatasub1$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime", main="", xaxt="n")

#Assume equal number of readings collected per day, label X axis by thirds
axis(1, at=0, label="Thu")
axis(1, at=1440, label="Fri")
axis(1, at=2880, label="Sat")

#Save the png file
dev.off()
