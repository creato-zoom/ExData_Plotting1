plot4 <- function()
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
  
  #Draw Plots
  png(file="plot4.png")
  par(mfrow = c(2, 2))
  
  #Draw Plot 1
  plot(subPowerData$DateTime,
       as.numeric(as.character(subPowerData$Global_active_power)), 
       type="n",
       xlab="",
       ylab="Global Active Power (kilowatts)")
  lines(subPowerData$DateTime,as.numeric(as.character(subPowerData$Global_active_power)))
  
  #Draw Plot 2
  plot(subPowerData$DateTime,
       as.numeric(as.character(subPowerData$Voltage)), 
       type="n",
       xlab="datetime",
       ylab="Voltage"
       )
  lines(subPowerData$DateTime,as.numeric(as.character(subPowerData$Voltage)))
  
  #Draw Plot 3
  plot(subPowerData$DateTime,
       as.numeric(as.character(subPowerData$Sub_metering_1)), 
       type="n",
       xlab="",
       ylab="Energy sub metering")
  lines(subPowerData$DateTime,as.numeric(as.character(subPowerData$Sub_metering_1)))
  lines(subPowerData$DateTime,as.numeric(as.character(subPowerData$Sub_metering_2)),col='red')
  lines(subPowerData$DateTime,as.numeric(as.character(subPowerData$Sub_metering_3)),col='blue')
  legend(x="topright", legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
         lty=c(1,1,1),
         col=c('black','red','blue'),
         bty="n",
         cex=.7)
  
  #Draw Plot 4
  plot(subPowerData$DateTime,
       as.numeric(as.character(subPowerData$Global_reactive_power)), 
       type="n",
       xlab="datetime",
       ylab="Global_reactive_power"
  )
  lines(subPowerData$DateTime,as.numeric(as.character(subPowerData$Global_reactive_power)))
  
  dev.off()
}

plot4()