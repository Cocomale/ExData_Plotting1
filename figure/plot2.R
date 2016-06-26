#Plot 2

#Load in necessary libraries
library(dplyr)
library(data.table)

#Reads in data from file then subsets data for specified dates
fh <- fread("F:/Coursera/Data Science Specialization/Course 4 - Exploratory Data Analysis/Week 1/Assignment 1/household_power_consumption.txt", na.strings="?",stringsAsFactors = FALSE)
pwrcons <- filter(fh, grep("^[1,2]/2/2007", Date))

pwrcons$Global_active_power <- as.numeric(as.character(pwrcons$Global_active_power))
pwrcons$Sub_metering_1 <- as.numeric(as.character(pwrcons$Sub_metering_1))
pwrcons$Sub_metering_2 <- as.numeric(as.character(pwrcons$Sub_metering_2))
pwrcons$Sub_metering_3 <- as.numeric(as.character(pwrcons$Sub_metering_3))

pwrcons$Voltage <- as.numeric(as.character(pwrcons$Voltage))

#Creates new column that combines date and time data 
pwrcons$Timestamp <-paste(pwrcons$Date, pwrcons$Time)

# Creates graph of date/time vs global active power data
png("plot2.png")
plot(strptime(pwrcons$Timestamp, "%d/%m/%Y %H:%M:%S"), pwrcons$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()