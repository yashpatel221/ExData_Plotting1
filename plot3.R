## Reading the text file
power <- read.table("household_power_consumption.txt", sep = ";", 
                    col.names = c("Date", "Time", "Global_active_power", 
                                  "Global_reactive_power", "Voltage", 
                                  "Global_intensity", "Sub_metering_1", 
                                  "Sub_metering_2", "Sub_metering_3"))

## Subsetting the data for the specified dates
required_data <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]

head(required_data)

## Joining the "Date" and "Time" column and storing it in "datetime
datetime <- strptime(paste(required_data$Date, required_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Changing the class of "Sub_metering_1" column to numeric
sm1 <- as.numeric(levels(required_data$Sub_metering_1))[required_data$Sub_metering_1]

## Changing the class of "Sub_metering_2" column to numeric
sm2 <- as.numeric(levels(required_data$Sub_metering_2))[required_data$Sub_metering_2]

## Changing the class of "Sub_metering_3" column to numeric
sm3 <- as.numeric(levels(required_data$Sub_metering_3))[required_data$Sub_metering_3]

## Creating a png file to store the plot
png(filename = "plot3.png", width = 480, height = 480)

## Plotting the graph for "datetime" vs "sm1"
plot(datetime, sm1, type="l", ylab="Energy Submetering", xlab="")

## Adding second line for "datetime" vs "sm2"
lines(datetime, sm2, type = "l", col = "red")

## Adding third line for "datetime" vs "sm3"
lines(datetime, sm3, type = "l", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1,
       lwd = 2, col = c("black", "red", "blue"))

dev.off()