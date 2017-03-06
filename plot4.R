data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
data$datetime <- with(data, paste(Date, Time))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
plotdata <- subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")
rm(data)
plotdata$datetime <- with(plotdata, strptime(datetime, "%d/%m/%Y %H:%M:%S"))
par(mfrow=c(2,2), bg="white")

with(plotdata, plot(datetime, Global_active_power, main="", xlab="", ylab="Global Active Power", type = "l"))

with(plotdata, plot(datetime, Voltage, main="", xlab="datetime", ylab="Voltage", type = "l"))

with(plotdata, plot(datetime, Sub_metering_1, main="", xlab="", ylab="Energy sub metering", type = "l"))
with(plotdata, points(datetime, Sub_metering_2, col="red", type="l"))
with(plotdata, points(datetime, Sub_metering_3, col="blue", type="l"))
legend("topright", bty="n", cex=0.85, lty=c(1,1), lwd=c(1,1), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(plotdata, plot(datetime, Global_reactive_power, main="", type = "l"))

png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2), bg="white")

with(plotdata, plot(datetime, Global_active_power, main="", xlab="", ylab="Global Active Power", type = "l"))

with(plotdata, plot(datetime, Voltage, main="", xlab="datetime", ylab="Voltage", type = "l"))

with(plotdata, plot(datetime, Sub_metering_1, main="", xlab="", ylab="Energy sub metering", type = "l"))
with(plotdata, points(datetime, Sub_metering_2, col="red", type="l"))
with(plotdata, points(datetime, Sub_metering_3, col="blue", type="l"))
legend("topright", bty="n", cex=0.9, lty=c(1,1), lwd=c(1,1), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(plotdata, plot(datetime, Global_reactive_power, main="", type = "l"))
dev.off()