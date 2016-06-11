data <- read.csv("relevant_data.csv", sep=";")

# Parse $Date and $Time together into an R date
data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %T")

png(file="plot4.png")
par(mfrow=c(2,2))

# Copied from plot2.R
with(data, {
    plot(datetime, Global_active_power, type="n", xlab="", ylab="Global Active Power");
    lines(datetime, Global_active_power)
  }
)


# New plot (upper right)
with(data, {
    plot(datetime, Voltage, type="n");
    lines(datetime, Voltage)
  }
)

# Copied from plot3.R
with(data, {
    plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering");
    lines(datetime, Sub_metering_1, col="black");
    lines(datetime, Sub_metering_2, col="red");
    lines(datetime, Sub_metering_3, col="blue");
    legend("topright", 
           lwd=1,
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col=c("black", "red", "blue"))
  }
)


# New plot (lower right)
with(data, {
    plot(datetime, Global_reactive_power, type="n");
    lines(datetime, Global_reactive_power)
  }
)

dev.off()
