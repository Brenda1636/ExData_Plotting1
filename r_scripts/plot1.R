## Creates plot1.png for Class Project 1 for Exploratory Data Analysis
## this assumes your working directory is the directory the text file is stored in

## read in data
household <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors=FALSE)
## make the date column an actual date type
household$Date <- as.Date(household$Date,"%d/%m/%Y")
## restrict the data set based on project instructions
household <- household[household$Date==as.Date('2007-02-01', "%Y-%m-%d") | household$Date==as.Date('2007-02-02', "%Y-%m-%d"),]
## make global active power a number
household$Global_active_power <- as.numeric(household$Global_active_power)

## create the histogram on the screen
hist(household$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
## Copy it to a png file
dev.copy(png,'plot1.png')
## close the device
dev.off()