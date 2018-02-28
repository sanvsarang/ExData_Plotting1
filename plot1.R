## Setting the working directory
filedir <- "C:/Users/Sanil/Documents/Data Science Coursera/Course 4 Exploratory Data Analysis/week 1/exdata%2Fdata%2Fhousehold_power_consumption/"
setwd(filedir)

## Reading file 
filename <- "household_power_consumption.txt"
hpc_df <- read.csv2(filename,sep = ";",colClasses = "character")

## Filtering for first two dates of February
hpc_df <- subset(hpc_df, subset = Date %in% c('1/2/2007','2/2/2007'))

## Opening png device
png(file = "plot1.png", width = 480, height = 480)

## Creating plot
hist(as.numeric(hpc_df$Global_active_power),col="red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")

## Closing device
dev.off()

