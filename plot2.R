# Exploratory Data Analysis - Week 1 Assignment
## Read data, generate plot & save as PNG file

plot2 <- function() {
  
  ## read data from text file
  ## install.packages("data.table")
  library(data.table) 
  source <- "household_power_consumption.txt"
  x <- read.table(source, sep=";", header=TRUE, na.strings="?")
  
  ## subset dates 2007-02-01 and 2007-02-02
  x$Date <- as.Date(as.character(x$Date), format="%d/%m/%Y")
  data <- subset(x, Date>="2007-02-01" & Date<="2007-02-02")
  
  ## generate plot2 figure
  datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
  plot(datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  ## save as PNG file
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
}