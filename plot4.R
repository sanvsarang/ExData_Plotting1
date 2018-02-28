## Setting the working directory
filedir <- "C:/Users/Sanil/Documents/Data Science Coursera/Course 4 Exploratory Data Analysis/week 1/exdata%2Fdata%2Fhousehold_power_consumption/"
setwd(filedir)

## Reading file 
filename <- "household_power_consumption.txt"
hpc_df <- read.csv2(filename,sep = ";",colClasses = "character")

## Filtering for first two dates of February
hpc_df <- subset(hpc_df, subset = Date %in% c('1/2/2007','2/2/2007'))

hpc_df$datetime <- with(hpc_df,as.POSIXct(paste(Date,Time), format = "%d/%m/%Y %H:%M:%S"))

## Opening png device
png(file = "plot4.png", width = 480, height = 480)

par(mfcol=c(2,2))

## Creating plots
#plot 1 Top-left
with(hpc_df, plot(x=datetime,y=Global_active_power,type="l",ylab = "Global Active Power",xlab = ""))

#plot 2 Bottom-left
with(hpc_df, plot(x=datetime,y=Sub_metering_1,type="n",ylab = "Energy sub metering", xlab = ""))
with(hpc_df, lines(x=datetime, y=Sub_metering_1))
with(hpc_df, lines(x=datetime, y=Sub_metering_2, col = "Red"))
with(hpc_df, lines(x=datetime, y=Sub_metering_3, col = "Blue"))
with(hpc_df, legend(x="topright", bty = "n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"), lty = c(1,1,1)))

#plot 3 Top-right
with(hpc_df, plot(x=datetime,y=Voltage,type="l"))

#plot 4 Bottom-right
with(hpc_df, plot(x=datetime,y=Global_reactive_power,type="l"))

## Closing device
dev.off()

