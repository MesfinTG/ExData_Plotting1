## get the data
setwd("C:/Users/user/DataScience_Coursera/exdata-data-household_power_consumption/")
hpc_data <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, header=TRUE)

## subset data for the two dates as specified in the course assignment
hpc_2day_data <- hpc_data[hpc_data$Date %in% c("1/2/2007","2/2/2007"),]

## format variables for graphing
hpc_2day_data[,3] <- as.numeric(hpc_2day_data[,3])
date_time <- strptime(paste(hpc_2day_data[,1], hpc_2day_data[,2], sep=" "), "%d/%m/%Y%H:%M:%S")

## create and save figure in a png file
png(filename="plot1.png", height=480, width=480, bg="white")
hist(hpc_2day_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", c='red')

dev.off()
