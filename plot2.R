plot2 <- function()
{
  if(!file.exists("household_power_consumption.txt")){
    message("File household_power_consumption.txt does not exist in working directory.")
    message("Please add household_power_consumption.txt to working directory and try again")
    return()
  } 
  #Data Setup
  powerData <- read.csv2(file = "household_power_consumption.txt", header=TRUE, na.strings = '?')
  powerData$Date <- as.Date(powerData$Date, format = "%d/%m/%Y")
  subPowerData <- powerData[powerData$Date>=as.Date("2007-02-01") & powerData$Date<=as.Date("2007-02-02") & !is.na(powerData$Global_active_power),]
  subPowerData$DateTime <- strptime(paste(subPowerData$Date,subPowerData$Time), format = "%Y-%m-%d %H:%M:%S")
  
  #Draw Plot
  png(file="plot2.png")
  plot(subPowerData$DateTime,
       as.numeric(as.character(subPowerData$Global_active_power)), 
       type="n",
       xlab="",
       ylab="Global Active Power (kilowatts)")
  lines(subPowerData$DateTime,as.numeric(as.character(subPowerData$Global_active_power)))
  dev.off()
}

plot2()