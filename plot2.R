## Read in the data and only take Feb 1 and Feb 2 2007
hpcAllData = read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
hpcAllData$Date <- as.Date(hpcAllData$Date, format = "%d/%m/%Y")
hpcData = subset(hpcAllData, Date == "2007-02-01" | Date == "2007-02-02")
hpcData$datetime <- strptime(paste(hpcData$Date, hpcData$Time), format = "%Y-%m-%d %H:%M:%S")

## Plot the line graph
plot(hpcData$datetime, hpcData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png")
dev.off()