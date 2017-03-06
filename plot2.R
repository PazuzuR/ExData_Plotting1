#load dataset
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
#convert dates and times
data$DateTime <- with(data, paste(Date, Time))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#prepare data
plotdata <- subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")
rm(data)
#create datetime
plotdata$DateTime <- with(plotdata,strptime(DateTime, "%d/%m/%Y %H:%M:%S"))
#make plot2
par(bg="white")
plot(plotdata$DateTime, plotdata$Global_active_power, main="", xlab="", ylab="Global Active Power (kilowatts)", type = "l")
#copy to png
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()