## Creation of Plot 1
## Read the Household Power Consumption data
consumptionData <- read.table("household_power_consumption.txt", header=F, sep=";", colClasses = "character")
## Selection of the needed data
selectionData <- consumptionData[grepl("^[12]/2/2007", consumptionData[,1]),]
## Binding Date and Time together to a single column
selectionData <- cbind(strptime(paste(selectionData[,1], selectionData[,2]), format="%d/%m/%Y %H:%M:%S"), selectionData[,-c(1,2)])
## Naming of the column headers
names(selectionData) <- c("Date/Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

## Open the PNG device, setting the desired size and naming the plot
png(filename="plot1.png", width=480, height=480)
## Creation of the histogram
hist(as.numeric(selectionData$Global_active_power), col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
## Closing the PNG device
dev.off()