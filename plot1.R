MyData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
MyData2 <- MyData[MyData$Date == "1/2/2007" | MyData$Date == "2/2/2007" , ]
with(MyData2, hist(Global_active_power, col = "red" ,main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot1.png")
dev.off()
