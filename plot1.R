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
png(filename="plot1.png")

#Create histogram Global Active Power with Y=Frequency and X = GlActPow (kilowatts)
hist(sourcedatasub1$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

#Save the png file
dev.off()
