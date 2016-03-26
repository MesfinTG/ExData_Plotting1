## Get data
setwd("C:/Users/user/DataScience_Coursera/exdata-data-household_power_consumption/")
hpc_data <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, header=TRUE)

## subset data for the two dates as specified in the course assignment
hpc_2day_data <- hpc_data[hpc_data$Date %in% c("1/2/2007","2/2/2007"),]

## format variables for graphing
date_time <- strptime(paste(hpc_2day_data[,1], hpc_2day_data[,2], sep=" "), "%d/%m/%Y%H:%M:%S")
hpc_2day_data[,7] <- as.numeric(hpc_2day_data[,7])
hpc_2day_data[,8] <- as.numeric(hpc_2day_data[,8])
hpc_2day_data[,9] <- as.numeric(hpc_2day_data[,9])

## create and save figure in a png file
png("plot3.png", width=480, height=480)

with(hpc_2day_data, {
        plot(date_time, hpc_2day_data[,7], type="l", col="black", xlab=" ",
             ylab="Energy sub metering", main=" ")
        lines(date_time, hpc_2day_data[,8], type="l", col="red", xlab=" ", main=" ")
        lines(date_time, hpc_2day_data[,9], type="l", col="blue", xlab=" ", main=" ")
        
}
)
legend ("topright", names(hpc_2day_data[-6][-5][-4][-3][-2][-1]),
        lty="solid", col=c("black", "red", "blue"), bty='n', cex=.75)

dev.off()
