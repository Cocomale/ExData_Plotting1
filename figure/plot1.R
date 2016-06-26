##Code for the first assignment plotting

#Reading the text file which has loads of rows

setwd("F:/Coursera/Data Science Specialization/Course 4 - Exploratory Data Analysis/Week 1/Assignment 1")
hpower <- read.csv("F:/Coursera/Data Science Specialization/Course 4 - Exploratory Data Analysis/Week 1/Assignment 1/household_power_consumption.txt", header=FALSE, sep=";")
View(household_power_consumption)

#Extracting column names

variables <- sapply(hpower[1,], as.character)
hpowercon <- hpower[2:tail(hpower,1),]
colnames(hpowercon) <- variables #Setting up the column names

#Reshaping the dataframe

fight <- as.data.frame(matrix(NA,nrow(hpowercon),ncol(hpowercon)))

for(i in 1:nrow(fight)){
  
  fight[i,3] <- as.numeric(as.vector(hpowercon[i,3]))
  fight[i,4] <- as.numeric(as.vector(hpowercon[i,4]))
  fight[i,5] <- as.numeric(as.vector(hpowercon[i,5]))
  fight[i,6] <- as.numeric(as.vector(hpowercon[i,6]))
  fight[i,7] <- as.numeric(as.vector(hpowercon[i,7]))
  fight[i,8] <- as.numeric(as.vector(hpowercon[i,8]))
  fight[i,9] <- as.numeric(as.vector(hpowercon[i,9]))
  
}

#Plot 1

png("plot1.png")
hist(fight$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()