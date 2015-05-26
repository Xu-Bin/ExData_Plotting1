# read data from data file
filename = "./household_power_consumption.txt"
rawdata <- read.csv(filename, sep = ";" , colClasses = "character")

# change the column type of Date 
rawdata$Date = as.Date(rawdata$Date, "%d/%m/%Y")


## subset the rawdata to 2007-02-01 and 2007-02-02
data <- rawdata[rawdata$Date == as.Date("2007-02-01") | rawdata$Date == as.Date("2007-02-02"), ]

time <- as.POSIXlt(paste(data$Date, data$Time))
# change the column type of Global_active_power
##data$Global_active_power = as.numeric(data$Global_active_power)
data$Sub_metering_1 = as.numeric(data$Sub_metering_1)
data$Sub_metering_2 = as.numeric(data$Sub_metering_2)
data$Sub_metering_3 = as.numeric(data$Sub_metering_3)

plot(time, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(time, data$Sub_metering_2, type = "l", col = "red")
lines(time, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", cex = 0.8, lty = 1 , lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()