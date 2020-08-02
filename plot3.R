library(tidyverse)

dat <- read.csv2("household_power_consumption.txt") #read in data

#convert Dates and Times in to date/time type
date <- dat$Date
time <- dat$Time
x <- paste(date, time)
y <- strptime(x, "%d/%m/%Y %H:%M:%S")
dat$dates <- y

#subset the dates of interest
dat <- filter(dat, dates > "2007-02-01", dates < "2007-02-03" )
dat <- select(dat, -Date, -Time)


#plot 1
png(file = "plot3.png")

dat$Sub_metering_1 <- as.numeric(dat$Sub_metering_1)
dat$Sub_metering_2 <- as.numeric(dat$Sub_metering_2)
dat$Sub_metering_3 <- as.numeric(dat$Sub_metering_3)

plot(dat$dates, dat$Sub_metering_1,
     type= "l",
     xlab = "",
     ylab= "Energy sub metering")

dev.off()


