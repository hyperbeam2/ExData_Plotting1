dataSource <- "./Data/household_power_consumption.txt"
data <- read.table(dataSource, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
partitionedData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(partitionedData$Date, partitionedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(partitionedData$Global_active_power)
png("Plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
