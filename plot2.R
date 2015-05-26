# read data from data file
filename = "./household_power_consumption.txt"
rawdata <- read.csv(filename, sep = ";" , colClasses = "character")

# change the column type of Date 
rawdata$Date = as.Date(rawdata$Date, "%d/%m/%Y")


## subset the rawdata to 2007-02-01 and 2007-02-02
data <- rawdata[rawdata$Date == as.Date("2007-02-01") | rawdata$Date == as.Date("2007-02-02"), ]

# change the column type of Global_active_power
data$Global_active_power = as.numeric(data$Global_active_power)

# plot the graph
time <- as.POSIXlt(paste(data$Date, data$Time))
plot(time, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

# copy to a png file
dev.copy(png, file = "plot2.png")
dev.off()

