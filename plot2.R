
## READING DATA 

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
head(data)
str(data)
names(data)

# Subset the days we want
working_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# numeric data

working_data$Global_active_power <- as.numeric(working_data$Global_active_power)
working_data$Global_reactive_power <- as.numeric(working_data$Global_reactive_power)
working_data$Voltage <- as.numeric(working_data$Voltage)
working_data$Global_intensity <- as.numeric(working_data$Global_intensity)
working_data$Sub_metering_1 <- as.numeric(working_data$Sub_metering_1)
working_data$Sub_metering_2 <- as.numeric(working_data$Sub_metering_2)
working_data$Sub_metering_3 <- as.numeric(working_data$Sub_metering_3)

# Date format and real time
working_data$Date <- as.Date(working_data$Date, '%d/%m/%Y')
working_data$Time <- paste(working_data$Date, working_data$Time)
working_data$Time <- as.POSIXct(strptime(working_data$Time, '%Y-%m-%d %H:%M:%S'))

# Min and Max time
xlim_min <- as.POSIXct(strftime("2007-02-01 00:00:00"))
xlim_max <- as.POSIXct(strftime("2007-02-03 00:00:00"))

# PLOTING

png("plot2.png", width = 480, height = 480)
plot(working_data$Time, working_data$Global_active_power, 
     xlim = c(xlim_min, xlim_max),
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()




