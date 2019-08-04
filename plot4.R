#####################################################################################################################
# Exploratory Data Analysis Course Project 1 
# Plot 4
# 
# Note: use setwd() to set work directory to the location contains contains household_power_consumption.txt, 
#       in my case, it is ./date/household_power_consumption.txt
#####################################################################################################################


# 
# read data file, 
# add a another datetime column by concatenating (date, time) columns and change its type to datetime
# subset data from "2007-02-01" to "2007-02-02"  -> Feb 
#

household_data=read.table("data/household_power_consumption.txt",sep = ';', header=TRUE, na.strings = '?' )
household_data$datetime <- strptime(paste(household_data$Date, household_data$Time), "%d/%m/%Y %H:%M:%S")
household_data$Date <- as.Date(household_data$Date, "%d/%m/%Y")
Feb <- subset(household_data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))


#
# plot 4
#
par(mfrow = c(2,2))
par(mar = c(4,4,4,4))

# (1,1)
with(Feb, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatt)" ))

# (1,2)
with(Feb, plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage" ))

# (2,1)
with(Feb, plot(datetime, Sub_metering_1, type='l',  xlab = "", ylab = "Energy sub metering"))
with(Feb, points(datetime, Sub_metering_2, type='l', col="red"  ))
with(Feb, points(datetime, Sub_metering_3, type='l', col="blue"  ))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# (2,2)
with(Feb, plot(datetime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power" ))
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()

