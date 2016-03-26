## Get data
setwd("C:/Users/user/DataScience_Coursera/exdata-data-household_power_consumption/")
hpc_data <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, header=TRUE)

## subset data for the two dates as specified in the course assignment
hpc_data <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, header=TRUE)


## format variables for grahing
hpc_2day_data <- hpc_data[hpc_data$Date %in% c("1/2/2007","2/2/2007"),]
hpc_2day_data[,3] <- as.numeric(hpc_2day_data[,3])
date_time <- strptime(paste(hpc_2day_data[,1], hpc_2day_data[,2], sep=" "), "%d/%m/%Y%H:%M:%S")

## create and save figure in a png file
png("plot2.png", width=480, height=480)
plot(date_time, hpc_2day_data$Global_active_power, type="l", xlab='', ylab="Global Active Power(kilowatts)")
dev.off()