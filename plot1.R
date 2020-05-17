## Reading the text file
power <- read.table("household_power_consumption.txt", sep = ";", 
                    col.names = c("Date", "Time", "Global_active_power", 
                                  "Global_reactive_power", "Voltage", 
                                  "Global_intensity", "Sub_metering_1", 
                                  "Sub_metering_2", "Sub_metering_3"))

## Subsetting the data for the specified dates
required_data <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]

## Changing the class of "Global_active_power" column to numeric
gap <- as.numeric(levels(required_data$Global_active_power))[required_data$Global_active_power]

## Creating a png file to store the plot
png(filename = "plot1.png", width = 480, height = 480)

## Plotting the histogram
hist(gap, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylim = c(0, 1200))

dev.off()


