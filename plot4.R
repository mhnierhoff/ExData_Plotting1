## Creation of Plot 4
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
png(filename="plot4.png", width=480, height=480)
## Setting of the plot area = 2 rows, 2 colums, order = adding plots by row
par(mfrow=c(2,2))

## Creation of Plot 1: Global Active Power
## 1. Step: Plot preparation without any data
plot(selectionData$Date, as.numeric(selectionData$Global_active_power), pch=NA, main="", ylab = "Global Active Power", xlab = "")
## 2. Step: Adding the required data
lines(selectionData$Date, as.numeric(selectionData$Global_active_power))

## Creation of Plot 2: Voltage
## 1. Step: Plot preparation without any data
plot(selectionData$Date, as.numeric(selectionData$Voltage), pch=NA, main="", ylab = "Voltage", xlab = "datetime")
## 2. Step: Adding the required data
lines(selectionData$Date, as.numeric(selectionData$Voltage))

## Creation of Plot 3: Energy Sub Metering
## 1. Step: Plot preparation without any data
plot(selectionData$Date, as.numeric(selectionData$Sub_metering_1), pch=NA, main="", ylab = "Energy sub metering", xlab = "")
## 2. Step: Adding the data and the desired colors to the sub_metering lines
lines(selectionData$Date, as.numeric(selectionData$Sub_metering_1), col="black")
lines(selectionData$Date, as.numeric(selectionData$Sub_metering_2), col="red")
lines(selectionData$Date, as.numeric(selectionData$Sub_metering_3), col="blue")
## 3. Step: Adding the desired legend to the plot, this time without legend border
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1),
       lwd=c(1,1,1),
       col=c("black", "red", "blue"),
       bty="n")

## Creation of Plot 4: Global Reactive Power
## 1. Step: Plot preparation without any data
plot(selectionData$Date, as.numeric(selectionData$Global_reactive_power), pch=NA, main="", ylab = "Global_reactive_power", xlab = "datetime")
## 2. Step: Adding the required data
lines(selectionData$Date, as.numeric(selectionData$Global_reactive_power))

## Closing the PNG device
dev.off()