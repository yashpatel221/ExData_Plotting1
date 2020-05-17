## Reading the text file
power <- read.table("household_power_consumption.txt", sep = ";", 
                    col.names = c("Date", "Time", "Global_active_power", 
                                  "Global_reactive_power", "Voltage", 
                                  "Global_intensity", "Sub_metering_1", 
                                  "Sub_metering_2", "Sub_metering_3"))

## Subsetting the data for the specified dates
required_data <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]

## Joining the "Date" and "Time" column and storing it in "datetime
datetime <- strptime(paste(required_data$Date, required_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Changing the class of "Global_active_power" column to numeric
gap <- as.numeric(levels(required_data$Global_active_power))[required_data$Global_active_power]

## Creating a png file to store the plot
png(filename = "plot2.png", width = 480, height = 480)

## Plotting the graph
plot(datetime, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()