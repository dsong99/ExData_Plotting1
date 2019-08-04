#####################################################################################################################
# Exploratory Data Analysis Course Project 1 
# Plot 2
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
# plot 2
#
with(Feb, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatt)" ))
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()

