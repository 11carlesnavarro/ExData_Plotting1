
install.packages("dplyr")
library(dplyr)


data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
head(data)
str(data)
names(data)

working_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
head(working_data)
dim(working_data)

working_data$Global_active_power <- as.numeric(working_data$Global_active_power)

# Data in date format 
working_data$Date <- as.Date(working_data$Date, '%d/%m/%Y')

# Make time a real variable
working_data$Time <- paste(working_data$Date, working_data$Time)
working_data$Time <- as.POSIXct(strptime(working_data$Time, '%Y-%m-%d %H:%M:%S'))
head(working_data)

# Min and Max time
xlim_min <- as.POSIXct(strftime("2007-02-01 00:00:00"))
xlim_max <- as.POSIXct(strftime("2007-02-03 00:00:00"))

# PLOTING

png("plot1.png", width = 480, height = 480)

par(mfrow = c(1,1))
hist(working_data$Global_active_power, breaks = 12, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

dev.off()

