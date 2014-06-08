## Creation of Plot 2
## Read the Household Power Consumption data
consumptionData <- read.table("household_power_consumption.txt", header=F, sep=";", colClasses = "character")
## Selection of the needed data
selectionData <- consumptionData[grepl("^[12]/2/2007", consumptionData[,1]),]
## Set German to English for the right day labels
Sys.setlocale(category = "LC_TIME", locale = "C")
## Binding Date and Time together to a single column
selectionData <- cbind(strptime(paste(selectionData[,1], selectionData[,2]), format="%d/%m/%Y %H:%M:%S"), selectionData[,-c(1,2)])
## Naming of the column headers
names(selectionData) <- c("Date/Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

## Open the PNG device, setting the desired size and naming the plot
png(filename="plot2.png", width=480, height=480)
## 1. Step: Plot preparation without any data
plot(selectionData$Date, as.numeric(selectionData$Global_active_power), pch=NA, main="", ylab = "Global Active Power (kilowatts)", xlab = "")
## 2. Step: Adding the data
lines(selectionData$Date, as.numeric(selectionData$Global_active_power))
## Closing the PNG device
dev.off()