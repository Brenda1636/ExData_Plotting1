## Creates plot2.png for Class Project 1 for Exploratory Data Analysis
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

## create the plot, but do not plot the dots
plot(household$fulldate, household$Global_active_power, type="n", ylab="Global Active Power (Kilowatts)", xlab="")
## create a line that connects the points
lines(household$fulldate,  household$Global_active_power) 
## save the plot as a png
dev.copy(png,'plot2.png')
## close the device
dev.off()