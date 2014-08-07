## Creates plot4.png for Class Project 1 for Exploratory Data Analysis
## this assumes your working directory is the directory the text file is stored in


## read in data
household <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors=FALSE)
## join the date and the time and make it an actual date/time object
household$fulldate <- strptime(paste(household$Date,household$Time), "%d/%m/%Y %H:%M:%S")
## make the date column an actual date type
household$Date <- as.Date(household$Date,"%d/%m/%Y")
## restrict the data set based on project instructions
household <- household[household$Date==as.Date('2007-02-01', "%Y-%m-%d") | household$Date==as.Date('2007-02-02', "%Y-%m-%d"),]

## make global active power a number
household$Global_active_power <- as.numeric(household$Global_active_power)
## makes voltage a number
household$Voltage <- as.numeric(household$Voltage)

## make sub metering values numeric so we can plot
household$Sub_metering_1 <- as.numeric(household$Sub_metering_1)
household$Sub_metering_2 <- as.numeric(household$Sub_metering_2)
household$Sub_metering_3 <- as.numeric(household$Sub_metering_3)

## makes global reactive power numeric so we can plot it
household$Global_reactive_power <- as.numeric(household$Global_reactive_power)

## tell the device you want two rows and two columns
par(mfrow=c(2,2))

## adds the plot to the top left without plotting the points
plot(household$fulldate, household$Global_active_power, type="n", ylab="Global Active Power", xlab="")
## plots the line
lines(household$fulldate,  household$Global_active_power) 

## adds the plot to the top right without plotting the points
plot(household$fulldate, household$Voltage, type="n", xlab="datetime", ylab="Voltage")
## plots the line
lines(household$fulldate, household$Voltage)

## make sub metering values numeric so we can plot
household$Sub_metering_1 <- as.numeric(household$Sub_metering_1)
household$Sub_metering_2 <- as.numeric(household$Sub_metering_2)
household$Sub_metering_3 <- as.numeric(household$Sub_metering_3)

## create the plot, but do not plot the dots
plot(household$fulldate, household$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")

## create the lines for the data
lines(household$fulldate,  household$Sub_metering_1) 
lines(household$fulldate,  household$Sub_metering_2, col="red") 
lines(household$fulldate, household$Sub_metering_3, col="blue")

## add the legend to the plot
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , 
       lty=1, col=c('black', 'red', 'blue'))

## create the plot, but do not plot the dots
plot(household$fulldate, household$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="n")
## plots the line
lines(household$fulldate, household$Global_reactive_power)

## copies the plot to the a png file
dev.copy(png, 'plot4.png', width=700)

## closes the device
dev.off()