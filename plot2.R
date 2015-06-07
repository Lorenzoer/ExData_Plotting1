MyData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
MyData2 <- MyData[MyData$Date == "1/2/2007" | MyData$Date == "2/2/2007" , ]
MyData2$Date <- as.character(MyData2$Date)
MyData2$Time <- as.character(MyData2$Time)
dates <- MyData2$Date
times <- MyData2$Time
nd <- paste(dates, times)
x <- as.POSIXct(strptime(nd, "%d/%m/%Y %H:%M:%S"))
y <- MyData2$Global_active_power
plot(x,y, ylab = "Global Active Power(kilowatts)", type = "l")
dev.copy(png, file = "plot2.png")
dev.off()
