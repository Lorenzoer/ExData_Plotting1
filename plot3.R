MyData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
MyData2 <- MyData[MyData$Date == "1/2/2007" | MyData$Date == "2/2/2007" , ]
MyData2$Date <- as.character(MyData2$Date)
MyData2$Time <- as.character(MyData2$Time)
dates <- MyData2$Date
times <- MyData2$Time
nd <- paste(dates, times)
x <- as.POSIXct(strptime(nd, "%d/%m/%Y %H:%M:%S"))
y1 <- MyData2$Sub_metering_1
y2 <- MyData2$Sub_metering_2
y3 <- MyData2$Sub_metering_3
png("plot3.png", width=480, height=480)
plot(x,y1, ylab = "Energy sub metering", type = "l")
lines(x,y2, type = "l", col = "red")
lines(x,y3, type = "l", col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# dev.copy(png, file = "plot3.png")
dev.off()
