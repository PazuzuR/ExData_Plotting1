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
#make plot3
par(bg="white")
plot(plotdata$DateTime, plotdata$Sub_metering_1, main="", xlab="", ylab="Energy sub metering", type = "l")
#add line 2
points(plotdata$DateTime, plotdata$Sub_metering_2, col="red", type="l")
#add line 3
points(plotdata$DateTime, plotdata$Sub_metering_3, col="blue", type="l")
#add legend
legend("topright", lty=c(1,1), lwd=c(1,1), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#copy to png
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()