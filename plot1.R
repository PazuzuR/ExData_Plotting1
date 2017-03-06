#load dataset
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
#convert dates and times
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#prepare data
plotdata <- subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")
rm(data)
#make plot1
par(bg="white")
hist(plotdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#copy to png
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()