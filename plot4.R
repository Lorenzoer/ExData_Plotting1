MyData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
MyData2 <- MyData[MyData$Date == "1/2/2007" | MyData$Date == "2/2/2007" , ]
MyData2$Date <- as.character(MyData2$Date)
MyData2$Time <- as.character(MyData2$Time)
dates <- MyData2$Date
times <- MyData2$Time
nd <- paste(dates, times)
x <- as.POSIXct(strptime(nd, "%d/%m/%Y %H:%M:%S"))
y <- MyData2$Global_active_power
y1 <- MyData2$Sub_metering_1
y2 <- MyData2$Sub_metering_2
y3 <- MyData2$Sub_metering_3
y4 <- MyData2$Voltage
y5 <- MyData2$Global_reactive_power
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2)) 
plot(x,y, ylab = "Global Active Power(kilowatts)", type = "l")
plot(x,y4, xlab = "datetime", ylab = "Voltage",type = "l")
plot(x,y1, ylab = "Energy sub metering", type = "l")
lines(x,y2, type = "l", col = "red")
lines(x,y3, type = "l", col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty='n', cex = 0.5)
plot(x,y5, xlab = "datetime", ylab = "Global_reactive_power",type = "l")
# dev.copy(png, file = "plot4.png")
dev.off()

