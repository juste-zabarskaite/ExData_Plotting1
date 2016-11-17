# Exploratory Data Analysis - Week 1 Assignment
## Read data, generate plot & save as PNG file

plot4 <- function() {
  
  ## read data from text file
  ## install.packages("data.table")
  library(data.table) 
  source <- "household_power_consumption.txt"
  x <- read.table(source, sep=";", header=TRUE, na.strings="?")
  
  ## subset dates 2007-02-01 and 2007-02-02
  x$Date <- as.Date(as.character(x$Date), format="%d/%m/%Y")
  data <- subset(x, Date>="2007-02-01" & Date<="2007-02-02")
  
  ## generate plot4 figures
  datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
  par(mfrow=c(2,2))
      
  ## 1
  plot(datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  ## 2
  plot(datetime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  ## 3
  plot(datetime, data$Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering" )
  lines(datetime, data$Sub_metering_2, col="red", type="l", xlab="", ylab="Energy sub metering")
  lines(datetime, data$Sub_metering_3, col="blue", type="l", xlab="", ylab="Energy sub metering")
  legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, y.intersp=1)
  
  ## 4
  plot(datetime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  
  ## save as PNG file
  dev.copy(png, file="plot4.png", width=480, height=480)
  dev.off()
}