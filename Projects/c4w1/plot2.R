data <- read.csv("relevant_data.csv", sep=";")

# Parse $Date and $Time together into an R date
data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %T")

png(file="plot2.png")


with(data, {
    plot(datetime, Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)");
    lines(datetime, Global_active_power)
  }
)


dev.off()
