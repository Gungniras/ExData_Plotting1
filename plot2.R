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


#plot 2
dat$Global_active_power <- as.numeric(dat$Global_active_power)
png(file = "plot2.png")
plot(dat$dates, dat$Global_active_power,
    type= "l",
    xlab = "",
    ylab= "Global Active Power (kilowatts)")
dev.off()


