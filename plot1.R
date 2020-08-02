
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
png(file = "plot1.png")
dat$Global_active_power <- as.numeric(dat$Global_active_power)
hist(dat$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()
     
