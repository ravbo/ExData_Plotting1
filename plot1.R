rm(list=ls())

# loading data
pow <- read.table("household_power_consumption.txt",sep=";",header = T)

# selecting dates
d1 = as.Date("2007-02-01")
d2 = as.Date("2007-02-02")
pow$date2 <- as.Date(pow$Date,format= "%d/%m/%Y")
pow <- subset(pow, date2>=d1 & date2<=d2)

# reconstructing temporal data for time plots
pow$timeofday <- with(pow, as.POSIXct(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))

# converting to numeric
gap <- as.numeric(as.character(pow$Global_active_power))
pow$Sub_metering_1 <- as.numeric(as.character(pow$Sub_metering_1))
pow$Sub_metering_2 <- as.numeric(as.character(pow$Sub_metering_2))
pow$Voltage <- as.numeric(as.character(pow$Voltage))

# save to .png file
png(file="plot1.png",width = 480, height = 480)
hist(gap,breaks = 12,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()