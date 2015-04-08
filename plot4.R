## Read in the data and only take Feb 1 and Feb 2 2007
hpcAllData = read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
hpcAllData$Date <- as.Date(hpcAllData$Date, format = "%d/%m/%Y")
hpcData = subset(hpcAllData, Date == "2007-02-01" | Date == "2007-02-02")
hpcData$datetime <- strptime(paste(hpcData$Date, hpcData$Time), format = "%Y-%m-%d %H:%M:%S")

## Plot multiple graphs
par(mfcol = c(2,2))

with(hpcData, {

	#1
	plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power")

	#2
	plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
	lines(datetime, Sub_metering_2, col="red")
	lines(datetime, Sub_metering_3, col="blue")
	legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, bty="n")

	#3
	plot(datetime, Voltage, type="l")

	#4
	plot(datetime, Global_reactive_power, type="l")
})

dev.copy(png, file="plot4.png")
dev.off()