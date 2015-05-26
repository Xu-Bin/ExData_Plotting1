# read data from data file
filename = "./household_power_consumption.txt"
rawdata <- read.csv(filename, sep = ";" , colClasses = "character")

# change the column type of Date 
rawdata$Date = as.Date(rawdata$Date, "%d/%m/%Y")


## subset the rawdata to 2007-02-01 and 2007-02-02
data <- rawdata[rawdata$Date == as.Date("2007-02-01") | rawdata$Date == as.Date("2007-02-02"), ]

# change the column type of Global_active_power
data$Global_active_power = as.numeric(data$Global_active_power)

# draw the hist
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# copy to a png file
dev.copy(png, file = "plot1.png")
dev.off()
