# Exploratory Data Analysis - Week 1 Assignment
## Read data, generate plot & save as PNG file

plot1 <- function() {
  
  ## read data from text file
  ## install.packages("data.table")
  library(data.table) 
  source <- "household_power_consumption.txt"
  x <- read.table(source, sep=";", header=TRUE, na.strings="?")
  
  ## subset dates 2007-02-01 and 2007-02-02
  x$Date <- as.Date(as.character(x$Date), format="%d/%m/%Y")
  data <- subset(x, Date>="2007-02-01" & Date<="2007-02-02")
  
  ## generate plot1 figure
  hist(data$Global_active_power, 
       col="red", 
       xlab="Global Active Power (kilowatts)",
       main="Global Active Power" 
  )
  
  ## save as PNG file
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
}